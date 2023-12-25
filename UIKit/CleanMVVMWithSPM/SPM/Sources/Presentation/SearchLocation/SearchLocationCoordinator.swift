//
//  SearchLocationCoordinator.swift
//  
//
//  Created by gnksbm on 2023/12/25.
//

import UIKit

import Core
import Domain

public final class SearchLocationCoordinator: Coordinator {
    public var navigationController: UINavigationController
    public var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let searchLocationVC = SearchLocationVC(
            viewModel: SearchlocationViewModel(
                useCase: UseCaseContainer.resolve(
                    type: SearchLocationUseCase.self
                )
            )
        )
        navigationController.setViewControllers([searchLocationVC], animated: false)
    }
}
