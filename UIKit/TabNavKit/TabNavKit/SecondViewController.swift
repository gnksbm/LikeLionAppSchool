//
//  SecondViewController.swift
//  TabNavKit
//
//  Created by gnksbm on 2023/07/19.
//

import UIKit

class SecondViewController: UIViewController {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .red
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let celsiusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "℃"
        textField.borderStyle = .bezel
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let calculateBurron: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.backgroundColor = .systemTeal
        button.layer.cornerRadius = 10
        button.setTitle("℃ → ℉", for: .normal)
        button.addTarget(self, action: #selector(calculateTemp), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let fahrenheitLabel: UILabel = {
        let label = UILabel()
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 5
        label.text = "℉"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pushButton: UIButton = {
        let button = UIButton()
        button.tintColor = .yellow
        button.backgroundColor = .orange
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
        title = "Second"
        view.backgroundColor = .systemBackground
        drawStackView()
        drawPushButton()
    }
    
    func drawStackView() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(celsiusTextField)
        stackView.addArrangedSubview(calculateBurron)
        stackView.addArrangedSubview(fahrenheitLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2),
            
            celsiusTextField.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6),
            calculateBurron.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6),
            fahrenheitLabel.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 6),
        ])
    }
    
    func drawPushButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrowshape.right.fill"), style: .plain, target: self, action: #selector(pushButtonTapped))
    }
    
    @objc func pushButtonTapped() {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
    
    @objc func calculateTemp() {
        guard let celsiusString = celsiusTextField.text,
              let celsiusDouble = Double(celsiusString) else { celsiusTextField.text = ""; return }
        fahrenheitLabel.text = "\(celsiusDouble * 1.8 + 32)℉"
    }
}
