//
//  LocationDetailVC.swift
//  
//
//  Created by gnksbm on 2023/12/25.
//

import UIKit

import RxSwift
import RxCocoa

final class LocationDetailVC: UIViewController {
    private let viewModel: LocationDetailViewModel
    private let disposeBag = DisposeBag()
    
    let textView = UITextView()
    
    init(viewModel: LocationDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
    }
    
    private func setupUI() {
        
    }
    
    private func bind() {
        let output = viewModel.transform(input: .init())
        output.textViewValue
            .withUnretained(self)
            .subscribe(
                onNext: { viewController, value in
                    viewController.textView.rx.text.onNext(value)
                    print(value)
                }
            ).disposed(by: disposeBag)
    }
}
