//
//  ViewController.swift
//  StudentKit
//
//  Created by gnksbm on 2023/06/14.
//

import UIKit

class ViewController: UIViewController {
    let tableView: StudentTableViewController = {
        let tableView = StudentTableViewController()
        tableView.view .translatesAutoresizingMaskIntoConstraints = false
        tableView.view.backgroundColor = .yellow
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        self.view.addSubview(tableView.view)
        NSLayoutConstraint.activate([
            tableView.view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80),
            tableView.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
            tableView.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            tableView.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
        ])
    }
    
}

