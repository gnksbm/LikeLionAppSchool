//
//
//  ViewController.swift
//  TabNavKit
//
//  Created by gnksbm on 2023/07/19.
//

import UIKit

class ViewController: UIViewController {
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .yellow
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var pushButton: UIButton = {
        let button = UIButton()
        button.tintColor = .systemMint
        button.backgroundColor = .systemTeal
        button.setTitle("다음 화면으로", for: .normal)
        button.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    func configureUI() {
        title = "First"
        view.backgroundColor = .systemBackground
        drawScrollView()
        drawPushButton()
    }
    
    func drawScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2),
        ])
    }

    func drawPushButton() {
        view.addSubview(pushButton)
        NSLayoutConstraint.activate([
            pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushButton.bottomAnchor.constraint(equalTo: scrollView.topAnchor, constant: -50)
        ])
    }
    
    @objc func pushButtonTapped() {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
}

