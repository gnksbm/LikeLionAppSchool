//
//  SearchLocationVC.swift
//  CleanMVVMWithSPM
//
//  Created by gnksbm on 2023/12/22.
//

import UIKit

import Core

import RxSwift
import RxCocoa

public final class SearchLocationVC: UIViewController {
    public var viewModel: SearchlocationViewModel
    private let disposeBag = DisposeBag()
    
    private let labelFont = UIFont.boldSystemFont(ofSize: 20)
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "검색어를 입력하세요"
        textField.leftView = UIView(frame: .init(origin: .zero, size: .init(width: 25, height: 25)))
        textField.leftViewMode = .always
        textField.rightView = searchBtn
        textField.rightViewMode = .always
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 25
        return textField
    }()
    
    private let searchBtn: UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "magnifyingglass")
        config.baseForegroundColor = .black
        let button = UIButton(configuration: config)
        return button
    }()
    
    private lazy var displayTitleLabel: UILabel = {
        let label = UILabel()
        label.font = labelFont
        label.text = "display"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var startTitleLabel: UILabel = {
        let label = UILabel()
        label.font = labelFont
        label.text = "start"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    
    private let resultTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SearchLocationTVCell.self)
        return tableView
    }()
    
    public init(viewModel: SearchlocationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupUI()
        bind()
    }
    
    private func setupDelegate() {
        searchTextField.delegate = self
    }
    
    private func setupUI() {
        view.backgroundColor = .lightGray
        [searchTextField, displayTitleLabel, pickerView, startTitleLabel, resultTableView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: safeArea.topAnchor),
            searchTextField.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            searchTextField.widthAnchor.constraint(
                equalTo: safeArea.widthAnchor,
                multiplier: 0.9
            ),
            searchTextField.heightAnchor.constraint(equalToConstant: 50),
            
            displayTitleLabel.topAnchor.constraint(
                equalTo: searchTextField.bottomAnchor,
                constant: 10
            ),
            displayTitleLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            displayTitleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45),
            
            startTitleLabel.topAnchor.constraint(
                equalTo: searchTextField.bottomAnchor,
                constant: 10
            ),
            startTitleLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            startTitleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45),
            
            pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pickerView.topAnchor.constraint(equalTo: displayTitleLabel.bottomAnchor),
            
            
            resultTableView.topAnchor.constraint(equalTo: pickerView.bottomAnchor),
            resultTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            resultTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            resultTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
    
    private func bind() {
        searchTextField.rx.text
            .orEmpty
            .map { !$0.isEmpty }
            .bind(to: searchBtn.rx.isEnabled)
            .disposed(by: disposeBag)
        
        let output = viewModel.transform(
            input: .init(
                searchTerm: searchTextField.rx.text
                    .orEmpty
                    .debounce(
                        RxTimeInterval.microseconds(5),
                        scheduler: MainScheduler.instance
                    ) // 0.5초 디바운스
                    .distinctUntilChanged() // 기존과 다른 아이템만 관찰
                    .asObservable(),
                pickerChanged: pickerView.rx
                    .itemSelected
                    .asObservable(),
                searchBtnTapped: searchBtn.rx.tap
                    .asObservable(),
                resultTapped: resultTableView.rx.itemSelected
                    .asObservable()
            )
        )
        
        output.fetchedRestaurant.bind(
            to: resultTableView.rx.items(
                cellIdentifier: SearchLocationTVCell.identifier,
                cellType: SearchLocationTVCell.self
            ),
            curriedArgument: { tv, item, cell in
                cell.titleLabel.text = item.title
                print("{")
                print(Mirror(reflecting: item).children.map {
                    "     \($0.label!) = \($0.value)"
                }.joined(separator: ",\n"))
                print("}")
            }
        )
        .disposed(by: disposeBag)
    }
}

extension SearchLocationVC: UITextFieldDelegate {
    
}

extension SearchLocationVC: UIPickerViewDelegate {
    public func pickerView(
        _ pickerView: UIPickerView,
        attributedTitleForRow row: Int,
        forComponent component: Int
    ) -> NSAttributedString? {
        NSAttributedString(
            string: row == 0 ? "선택안함" : String(row)
        )
    }
}

extension SearchLocationVC: UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    public func pickerView(
        _ pickerView: UIPickerView,
        numberOfRowsInComponent component: Int
    ) -> Int {
        switch component {
        case 0:
            return 6
        case 1:
            return 101
        default:
            return 0
        }
    }
    
    public func pickerView(
        _ pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
    ) -> String? {
        "테스트"
    }
}

#if DEBUG
import SwiftUI
import Core
import Domain

struct SearchLocationPreview: PreviewProvider {
    class PreviewUseCase: SearchLocationUseCase {
        var successedFetch: RxSwift.PublishSubject<[Domain.SearchLocationEntity]>
        
        init(successedFetch: RxSwift.PublishSubject<[Domain.SearchLocationEntity]>) {
            self.successedFetch = successedFetch
        }
        
        func searchLocation(
            request: SearchLocationRequest
        ) {
            successedFetch.onNext([
                .init(
                    title: "타이틀",
                    link: "",
                    category: "",
                    description: "",
                    telephone: "",
                    address: "",
                    roadAddress: "",
                    mapx: "",
                    mapy: ""
                )
            ])
        }
    }
    
    static var previews: some View {
        UIKitPreview {
            SearchLocationVC(
                viewModel: SearchlocationViewModel(
                    useCase: PreviewUseCase(
                        successedFetch: .init()
                    ),
                    coordinator: DefaultSearchLocationCoordinator(navigationController: .init())
                )
            )
        }
    }
}
#endif
