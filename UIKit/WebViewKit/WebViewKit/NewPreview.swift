//
//  Preview.swift
//  UIKitPractice
//
//  Created by gnksbm on 2023/07/24.
//

import UIKit
import SwiftUI

//enum EnumTab: Int, CaseIterable {
////MARK: - Set Here
//    case <#case#>, <#case#>, <#case#>
//
//    static var rootViewIndex = <#rootViewIndex#>
//
//    var info: VCInfo {
//        let title = "\(self)"
//        switch self {
//        case .home:
//            return VCInfo(title: title, systemImageName: "<#systemImageName#>", vc: <#ViewController#>())
//        case .chat:
//            return VCInfo(title: title, systemImageName: "<#systemImageName#>", vc: <#ViewController#>())
//        case .others:
//            return VCInfo(title: title, systemImageName: "<#systemImageName#>", vc: <#ViewController#>())
//        @unknown case _:
//            print("This is not defined case: \(self)")
//            break
//        }
//    }
////MARK: - Logic
//
//    struct VCInfo {
//        var title: String
//        var systemImageName: String
//        var vc: UIViewController
//    }
//
//    static func makeAllCasesToViewControllers() -> [UINavigationController] {
//        var viewControllers: [UINavigationController] = []
//
//        Self.allCases.forEach {
//            let viewController = UINavigationController(rootViewController: $0.info.vc)
//            viewController.tabBarItem = UITabBarItem(title: $0.info.title, image: UIImage(systemName: $0.info.systemImageName), tag: $0.rawValue)
//            viewControllers.append(viewController)
//        }
//
//        return viewControllers
//    }
//}

struct UIKitVCPreview: UIViewControllerRepresentable {
    
    let viewControllerGenerator: () -> UIViewController
    
    init(viewControllerGenerator: @escaping () -> UIViewController) {
        self.viewControllerGenerator = viewControllerGenerator
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        viewControllerGenerator()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct UIKitNaviVCPreview: UIViewControllerRepresentable {
    
    let viewControllerGenerator: () -> UINavigationController
    
    init(viewControllerGenerator: @escaping () -> UINavigationController) {
        self.viewControllerGenerator = viewControllerGenerator
    }
    
    func makeUIViewController(context: Context) -> some UINavigationController {
        viewControllerGenerator()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

//MARK: - MainTabbar, MainTabbar_Preview

//class MainTabbar: UITabBarController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.viewControllers = EnumTab.makeAllCasesToViewControllers()
//        self.selectedIndex = EnumTab.rootViewIndex
//        self.tabBar.tintColor = .black
//        self.tabBar.backgroundColor = .white
//    }
//}

//struct MainTabbar_Preview: PreviewProvider {
//    static var previews: some View {
//        UIKitVCPreview {
////            MainTabbar()
//        }
//    }
//}
