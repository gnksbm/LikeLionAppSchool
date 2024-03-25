//
//  NaverMapViewController.swift
//  NaverMapKit
//
//  Created by gnksbm on 3/25/24.
//

import UIKit

import NMapsMap
import RxCocoa

class NaverMapViewController: UIViewController {
    private let viewModel: NaverMapViewModel
    
    private let naverMapView = NMFMapView()
    
    init(viewModel: NaverMapViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        [naverMapView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            naverMapView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            naverMapView.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor
            ),
            naverMapView.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor
            ),
            naverMapView.bottomAnchor.constraint(
                equalTo: safeArea.bottomAnchor
            ),
        ])
    }
    
    private func bind() {
        let output = viewModel.transform(
            input: .init(
                viewWillAppearEvent: rx
                    .methodInvoked(#selector(UIViewController.viewWillAppear))
                    .map { _ in },
                informationViewTapEvent: .empty(),
                selectedBusStopId: .empty(),
                locationChangeEvent: .empty())
        )
    }
}

