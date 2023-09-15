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
        
//        let albumBtn = UIBarButtonItem(customView: BlurView())
//        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
//        let playBtn = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: nil)
//        let nextBtn = UIBarButtonItem(image: UIImage(systemName: "forward.end.fill"), style: .plain, target: self, action: nil)
//        let playListBtn = UIBarButtonItem(image: UIImage(systemName: "music.note.list"), style: .plain, target: self, action: nil)
//        let items = [albumBtn, flexible, playBtn, nextBtn, playListBtn].map { btn in
//            btn.tintColor = .white
//            return btn
//        }
//        tabbar.children.forEach { navController in
//            navController.children.forEach { vc in
//                vc.navigationController?.isToolbarHidden = false
//                vc.view.backgroundColor = .systemTeal
//                vc.toolbarItems = items
//            }
//        }
        
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

