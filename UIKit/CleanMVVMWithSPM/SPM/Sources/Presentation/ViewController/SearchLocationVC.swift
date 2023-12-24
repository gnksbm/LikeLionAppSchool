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
    public var viewModel: SearchlocationViewModel!
    private let disposeBag = DisposeBag()
    
    private let labelFont = UIFont.boldSystemFont(ofSize: 20)
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "검색어를 입력하세요"
        textField.rightView = searchBtn
        textField.rightViewMode = .always
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
        view.backgroundColor = .white
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
            
            displayTitleLabel.topAnchor.constraint(equalTo: searchTextField.bottomAnchor),
            displayTitleLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            displayTitleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            startTitleLabel.topAnchor.constraint(equalTo: searchTextField.bottomAnchor),
            startTitleLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            startTitleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
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
            )
        ) { tv, item, cell in
            cell.titleLabel.text = item.title
        }
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
            let searchLocationVC = SearchLocationVC()
            searchLocationVC.viewModel = SearchlocationViewModel(
                useCase: PreviewUseCase(
                    successedFetch: .init()
                )
            )
            return searchLocationVC
        }
    }
}
#endif
