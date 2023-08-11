//
//  Preview.swift
//  VibeCloneKit
//
//  Created by gnksbm on 2023/08/11.
//

import SwiftUI

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
