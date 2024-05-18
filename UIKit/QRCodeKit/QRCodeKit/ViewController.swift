//
//  ViewController.swift
//  QRCodeKit
//
//  Created by gnksbm on 5/18/24.
//

import UIKit
import CoreImage.CIFilterBuiltins

final class ViewController: UIViewController {
    private lazy var textField = {
        let textField = UITextField()
        textField.attributedPlaceholder = .init(
            string: "QR 코드를 생성 할 문자를 입력하세요",
            attributes: [
                .foregroundColor: UIColor.gray
            ]
        )
        textField.addTarget(
            self,
            action: #selector(textFieldDidChanged),
            for: .editingChanged
        )
        textField.backgroundColor = .white
        return textField
    }()
    
    private lazy var qrGenerateButton = {
        let button = UIButton(configuration: .borderedTinted())
        button.titleLabel?.textAlignment = .center
        button.setTitle(
            "QR Code 생성하기",
            for: .normal
        )
        button.isEnabled = false
        button.addTarget(
            self,
            action: #selector(generateButtonDidTapped),
            for: .touchUpInside
        )
        return button
    }()
    
    private let qrReaderButton = {
        let button = UIButton(configuration: .borderedTinted())
        button.titleLabel?.textAlignment = .center
        button.setTitle(
            "QR Code 인식하기",
            for: .normal
        )
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        [textField, qrGenerateButton, qrReaderButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(
                equalTo: safeArea.topAnchor,
                constant: 20
            ),
            textField.widthAnchor.constraint(
                equalTo: safeArea.widthAnchor,
                multiplier: 0.8
            ),
            textField.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            textField.heightAnchor.constraint(equalToConstant: 30),
            
            qrGenerateButton.topAnchor.constraint(
                equalTo: textField.bottomAnchor,
                constant: 20
            ),
            qrGenerateButton.widthAnchor.constraint(
                equalTo: textField.widthAnchor
            ),
            qrGenerateButton.centerXAnchor.constraint(
                equalTo: textField.centerXAnchor
            ),
            
            qrReaderButton.topAnchor.constraint(
                equalTo: qrGenerateButton.bottomAnchor,
                constant: 20
            ),
            qrReaderButton.widthAnchor.constraint(
                equalTo: qrGenerateButton.widthAnchor
            ),
            qrReaderButton.centerXAnchor.constraint(
                equalTo: qrGenerateButton.centerXAnchor
            ),
        ])
    }
    
    @objc private func textFieldDidChanged(_ sender: UITextField) {
        guard let text = sender.text else { return }
        qrGenerateButton.isEnabled = !text.isEmpty
    }
    
    @objc private func generateButtonDidTapped(_ sender: UIButton) {
        guard let text = textField.text else { return }
        presentToQRCodeView(text: text)
    }
    
    private func presentToQRCodeView(text: String) {
        let qrViewController = QRImageViewController(text: text)
        present(
            qrViewController,
            animated: true
        )
    }
}

