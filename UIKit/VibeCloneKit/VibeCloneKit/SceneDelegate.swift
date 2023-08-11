//
//  SceneDelegate.swift
//  VibeCloneKit
//
//  Created by gnksbm on 2023/08/11.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        
        let tabbar = UITabBarController()
        tabbar.viewControllers = Tab.makeAllCasesToViewControllers()
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabbar
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

