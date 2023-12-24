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
    public var viewModel: SearchViewModel!
    private let disposeBag = DisposeBag()
    
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
        [searchTextField, resultTableView].forEach {
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
            
            resultTableView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor),
            resultTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            resultTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            resultTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
    
    private func bind() {
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
                searchBtnTapped: searchBtn.rx.tap
                    .asObservable()
            )
        )
        output.fetchedRestaurant
            .bind(
                to: resultTableView.rx.items(
                    cellIdentifier: SearchLocationTVCell.identifier,
                    cellType: SearchLocationTVCell.self
                )
            ) { tv, item, cell in
                cell.titleLabel.text = item.title
            }.disposed(by: disposeBag)
    }
}

extension SearchLocationVC: UITextFieldDelegate {
    
}

#if DEBUG
import SwiftUI
import Core
import Domain

struct SearchLocation: PreviewProvider {
    class PreviewUseCase: SearchLocationUseCase {
        var successedFetch: RxSwift.PublishSubject<[Domain.Restaurant]>
        
        init(successedFetch: RxSwift.PublishSubject<[Domain.Restaurant]>) {
            self.successedFetch = successedFetch
        }
        
        func searchLocation(query: String, display: Int?, start: Int?, sort: String?) {
            successedFetch.onNext([
                .init(
                    title: query,
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
            print(query)
        }
    }
    
    static var previews: some View {
        UIKitPreview {
            let searchLocationVC = SearchLocationVC()
            searchLocationVC.viewModel = SearchViewModel(
                useCase: PreviewUseCase(
                    successedFetch: .init()
                )
            )
            return searchLocationVC
        }
    }
}
#endif
