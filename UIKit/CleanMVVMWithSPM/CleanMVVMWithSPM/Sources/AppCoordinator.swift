//
//  AppCoordinator.swift
//  CleanMVVMWithSPM
//
//  Created by gnksbm on 2023/12/25.
//  Copyright © 2023 gnksbm. All rights reserved.
//

import UIKit

import Presentation
import Domain
import Core

final class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let searchLocationVC = SearchLocationVC(
            viewModel: SearchlocationViewModel(
                useCase: UseCaseContainer.resolve(
                    type: SearchLocationUseCase.self
                )
            )
        )
        navigationController.pushViewController(searchLocationVC, animated: false)
    }
}
