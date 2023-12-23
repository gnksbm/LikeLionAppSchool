//
//  SearchLocationVC.swift
//  CleanMVVMWithSPM
//
//  Created by gnksbm on 2023/12/22.
//

import UIKit

import RxSwift
import RxCocoa

public final class SearchLocationVC: UIViewController {
    public var viewModel: SearchViewModel!
    private let disposeBag = DisposeBag()
    
    private let searchTextField = UITextField()
    private let searchBtn = UIButton()
    private let resultTableView = UITableView()
    
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
        [searchTextField, searchBtn, resultTableView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: safeArea.topAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            searchTextField.widthAnchor.constraint(
                equalTo: safeArea.widthAnchor,
                multiplier: 0.8
            ),
            searchTextField.heightAnchor.constraint(equalToConstant: 50),
            
            searchBtn.topAnchor.constraint(equalTo: safeArea.topAnchor),
            searchBtn.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            searchBtn.heightAnchor.constraint(equalToConstant: 50),
            
            resultTableView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor),
            resultTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            resultTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            resultTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
    
    private func bind() {
        let output = viewModel.transform(
            input: .init(
                searchText: searchTextField.rx.text
                    .orEmpty
                    .asObservable(),
                searchBtnTapped: searchBtn.rx.tap
                    .asObservable()
            )
        )
    }
}

extension SearchLocationVC: UITextFieldDelegate {
    
}

#if DEBUG
import Core
import SwiftUI

struct SearchLocation: PreviewProvider {
    static var previews: some View {
        UIKitPreview {
            SearchLocationVC()
        }
    }
}
#endif
