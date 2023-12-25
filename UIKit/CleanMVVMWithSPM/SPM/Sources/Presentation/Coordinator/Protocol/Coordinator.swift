//
//  Coordinator.swift
//  
//
//  Created by gnksbm on 2023/12/25.
//

import UIKit

public protocol Coordinator {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    
    func start()
}
