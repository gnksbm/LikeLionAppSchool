//
//  Preview.swift
//  URLImageKit
//
//  Created by gnksbm on 2023/10/06.
//

import SwiftUI

struct UIKitPreview: UIViewControllerRepresentable {
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
