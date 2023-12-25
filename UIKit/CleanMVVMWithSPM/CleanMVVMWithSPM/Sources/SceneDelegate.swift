//
//  SceneDelegate.swift
//  CleanMVVMWithSPM
//
//  Created by gnksbm on 2023/12/22.
//

import UIKit

import Core
import Presentation
import Domain
import Data
import Network

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene)
        else { return }
        window = UIWindow(windowScene: windowScene)
        
        let appCoordinator = AppCoordinator(
            navigationController: UINavigationController()
        )
        appCoordinator.start()
        window?.rootViewController = appCoordinator.navigationController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

#if DEBUG
import SwiftUI

struct SceneDelegatePreview: PreviewProvider {
    
    static var previews: some View {
        UIKitPreview {
            SearchLocationVC(
                viewModel: SearchlocationViewModel(
                    useCase: UseCaseContainer.resolve(
                        type: SearchLocationUseCase.self
                    )
                )
            )
        }
    }
}
#endif
