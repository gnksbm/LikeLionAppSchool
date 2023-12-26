//
//  DefaultSearchLocationCoordinator.swift
//  
//
//  Created by gnksbm on 2023/12/25.
//

import UIKit

import Core
import Domain

public final class DefaultSearchLocationCoordinator {
    public var navigationController: UINavigationController
    public var childCoordinators: [Coordinator] = []
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let searchLocationVC = SearchLocationVC(
            viewModel: SearchlocationViewModel(
                useCase: UseCaseContainer.resolve(
                    type: SearchLocationUseCase.self
                ),
                coordinator: self
            )
        )
        navigationController.setViewControllers([searchLocationVC], animated: false)
    }
    
}


extension DefaultSearchLocationCoordinator: SearchLocationCoordinator {
    public func pushDetail(entity: SearchLocationEntity) {
        navigationController.pushViewController(
            LocationDetailVC(
                viewModel: LocationDetailViewModel(
                    entity: entity
                )
            ),
            animated: true
        )
    }
}
