//
//  MainTabBarCoordinator.swift
//  
//
//  Created by gnksbm on 2023/12/25.
//

import UIKit

public final class MainTabBarCoordinator: Coordinator {
    public var navigationController: UINavigationController
    public var childCoordinators: [Coordinator] = []
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let tabBarController = makeTabbar()
        navigationController.setViewControllers([tabBarController], animated: false)
    }
    
    private func makeTabbar() -> UITabBarController {
        let viewControllers = MainTab.allCases.map { makeViewController($0) }
        let tabBarController = MainTabBarController()
        tabBarController.setViewControllers(viewControllers, animated: false)
        return tabBarController
    }
    
    private func makeViewController(_ tab: MainTab) -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.tabBarItem = tab.tabBarItem
        startTabCoordinator(tab, navigationController: navigationController)
        return navigationController
    }
    
    private func startTabCoordinator(
        _ tab: MainTab,
        navigationController: UINavigationController
    ) {
        var coordinator: Coordinator
        switch tab {
        case .search:
            coordinator = DefaultSearchLocationCoordinator(
                navigationController: navigationController
            )
        }
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
