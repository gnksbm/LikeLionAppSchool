//
//  UIKitPreview.swift
//  
//
//  Created by gnksbm on 2023/12/23.
//

import SwiftUI

#if DEBUG
public struct UIKitPreview: UIViewControllerRepresentable {
    let viewController: () -> UIViewController
    
    public init(viewController: @escaping () -> UIViewController) {
        self.viewController = viewController
    }
    
    public func makeUIViewController(context: Context) -> some UIViewController {
        viewController()
    }
    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}
#endif
