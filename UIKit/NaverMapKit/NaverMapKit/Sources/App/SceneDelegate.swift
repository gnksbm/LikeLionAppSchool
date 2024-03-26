//
//  SceneDelegate.swift
//  NaverMapKit
//
//  Created by gnksbm on 3/25/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let useCase = NaverMapUseCase(
            busStopInfoRepository: .init(),
            locationService: .init()
        )
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = NaverMapViewController(
            viewModel: .init(useCase: useCase)
        )
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

