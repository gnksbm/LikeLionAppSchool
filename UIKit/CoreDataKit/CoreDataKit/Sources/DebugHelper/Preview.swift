//
//  Preview.swift
//  CoreDataKit
//
//  Created by gnksbm on 2023/12/14.
//  Copyright © 2023 gnksbm. All rights reserved.
//

import SwiftUI

#if DEBUG
struct UIKitPreview: UIViewControllerRepresentable {
    let viewController: () -> UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        viewController()
    }
    
    func updateUIViewController(
        _ uiViewController: UIViewController,
        context: Context
    ) { }
}
#endif
