//
//  ViewController.swift
//  FIDKIT
//
//  Created by gnksbm on 2023/09/04.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    let authContext = LAContext()
    
    var isLogin = false {
        didSet {
            if isLogin {
                nextVC()
            }
        }
    }
    let imgConfig = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 25))
    
    let btnConfig: UIButton.Configuration = {
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.baseBackgroundColor = .red
        config.baseForegroundColor = .white
        return config
    }()
    
    lazy var faceIDBtn: UIButton = {
        let image = UIImage(systemName: "faceid", withConfiguration: imgConfig)
        let btn = UIButton(configuration: btnConfig)
        btn.configuration?.image = image
        btn.addTarget(self, action: #selector(faceIDBtnTapped), for: .touchUpInside)
        return btn
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureUI()
    }
    
    func configureUI() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        [faceIDBtn].forEach {
//            $0.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview($0)
        }
        
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
        ])
    }
    
    func nextVC() {
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(ViewController(), animated: true)
        }
    }
    
    @objc func faceIDBtnTapped() {
        authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "생체인증합시다") { [weak self] result, error in
            guard let self else { return }
            print(result)
            self.isLogin = result
        }
    }
    
}

