//
//  ViewController.swift
//  KakaoMapKit
//
//  Created by gnksbm on 2/3/24.
//

import UIKit

import KakaoMapsSDK
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    private let viewModel = ViewModel()
    private let mapContainer = KMViewContainer()
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bind()
    }
    
    private func configureUI() {
        view.addSubview(mapContainer)
        mapContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mapContainer.topAnchor.constraint(equalTo: view.topAnchor),
            mapContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func bind() {
        let output = viewModel.transform(
            input: .init(
                mapContainer: mapContainer,
                viewWillAppearEvent: rx.methodInvoked(
                    #selector(UIViewController.viewWillAppear)
                )
                .map { _ in },
                viewWillDisappearEvent: rx.methodInvoked(
                    #selector(UIViewController.viewWillDisappear)
                )
                .map { _ in },
                viewDidDisappearEvent: rx.methodInvoked(
                    #selector(UIViewController.viewDidDisappear)
                )
                .map { _ in }
            )
        )
    }
}
