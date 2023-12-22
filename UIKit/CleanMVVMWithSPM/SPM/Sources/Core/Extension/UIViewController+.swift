//
//  File.swift
//  
//
//  Created by gnksbm on 2023/12/22.
//

import UIKit

extension UIViewController {
    #if DEBUG
    public func viewTest() {
        view.backgroundColor = .red
        let testLabel = UILabel()
        testLabel.text = "Test"
        testLabel.font = .boldSystemFont(ofSize: 20)
        testLabel.textColor = .black
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(testLabel)
        NSLayoutConstraint.activate([
            testLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    #endif
}
