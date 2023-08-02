//
//  ViewController.swift
//  TableViewTest
//
//  Created by woojin Shin on 2023/07/24.
//

import UIKit
import SwiftUI

class ViewController1: UIViewController {

    lazy var label: UILabel = {
        let label = UILabel()

        label.text = "Hello World"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    lazy var label1: UILabel = {
        let label = UILabel()

        label.text = "안녕 월드"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(label)
        view.addSubview(label1)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
        ])
    }
}

struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            ViewController1()
        }
    }
}
