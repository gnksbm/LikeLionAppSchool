//
//  AppDelegate+Dependency.swift
//  CleanMVVMWithSPM
//
//  Created by gnksbm on 2023/12/24.
//  Copyright © 2023 gnksbm. All rights reserved.
//

import Foundation

import Core
import Domain
import Data
import Network

extension AppDelegate {    
    var networkService: NetworkService {
        DefaultNetworkService()
    }

    func registUseCase() {
        UseCaseContainer.register(
            type: SearchLocationUseCase.self,
            DefaultSearchLocationUseCase(
                repository: DefaultSearchLocationRepository(
                    networkService: networkService
                )
            )
        )
    }
}
