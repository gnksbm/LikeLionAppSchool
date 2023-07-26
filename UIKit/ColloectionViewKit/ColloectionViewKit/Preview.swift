//
//  Preview.swift
//  UIKitPractice
//
//  Created by gnksbm on 2023/07/24.
//

import UIKit
import SwiftUI

struct ViewControllerPreview: UIViewControllerRepresentable {
    
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

class PreviewScene: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = ViewController()
        vc1.tabBarItem = UITabBarItem(title: "Label", image: UIImage(systemName: "note.text"), tag: 0)
        
        let vc2 = ViewController()
        vc2.tabBarItem = UITabBarItem(title: "Label", image: UIImage(systemName: "button.programmable"), tag: 1)
        
        let vc3 = ViewController()
        vc3.tabBarItem = UITabBarItem(title: "Label", image: UIImage(systemName: "list.bullet.circle"), tag: 2)
        
        self.viewControllers = [vc1, vc2, vc3]
        self.selectedIndex = 2
        self.tabBar.tintColor = .black
        self.tabBar.backgroundColor = .white
    }
}

struct ScenePreview: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            PreviewScene()
        }
    }
}

enum DeviceType {
    case iPhoneSE3
    case iPhone14Pro
    case iPhone14ProMax

    func deviceType() -> String {
        switch self {
        case .iPhoneSE3:
            return "iPhone SE (3rd generation)"
        case .iPhone14Pro:
            return "iPhone 14 Pro"
        case .iPhone14ProMax:
            return "iPhone 14 Pro Max"
        }
    }
}


extension UIViewController {

    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }

    func showPreview(_ deviceType: DeviceType = .iPhone14Pro, displayName: String = "아이폰14프로") -> some View {
        Preview(viewController: self)
            .previewDevice(PreviewDevice(rawValue: deviceType.deviceType()))
            .previewDisplayName(displayName)
    }
    
}


// 사용 예시
//struct ViewController_Preview: PreviewProvider {
//    static var previews: some View {
//        ViewController().showPreview(.iPhoneSE3, displayName: "아이폰se3")
//        ViewController().showPreview(.iPhone14Pro)
//    }
//}
