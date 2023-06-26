//
//  ViewController.swift
//  RockPaperScissorsKit
//
//  Created by gnksbm on 2023/06/26.
//

import UIKit

class ViewController: UIViewController {
    var comScore = 0 {
        didSet {
            if comScore > 2 {
                resultLabel.text = "조금 더 분발 하도록 🙏"
            }
            comScoreLabel.text = "컴퓨터: \(comScore)"
        }
    }
    var userScore = 0 {
        didSet {
            userScoreLabel.text = "사용자: \(userScore)"
            if userScore > 2 {
                resultLabel.text = "좀 치네?.."
            }
        }
    }
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "한번 이겨봐"
        label.font = .boldSystemFont(ofSize: 43)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let comRPSLabel: UILabel = {
        let label = UILabel()
        label.text = "?"
        label.font = .systemFont(ofSize: 150)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let scoreStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    lazy var comScoreLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        label.text = "컴퓨터: \(comScore)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var userScoreLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        label.text = "사용자: \(userScore)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var rockButton: UIButton = {
        let button = UIButton()
        button.setTitle(rpsArray[0].rawValue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 100)
        button.addTarget(self, action: #selector(rpsButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let scissorsButton: UIButton = {
        let button = UIButton()
        button.setTitle(rpsArray[1].rawValue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 100)
        button.addTarget(self, action: #selector(rpsButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let paperButton: UIButton = {
        let button = UIButton()
        button.setTitle(rpsArray[2].rawValue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 100)
        button.addTarget(self, action: #selector(rpsButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 35)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(resultLabel)
        self.view.addSubview(comRPSLabel)
        self.view.addSubview(scoreStackView)
        scoreStackView.addSubview(comScoreLabel)
        scoreStackView.addSubview(userScoreLabel)
        self.view.addSubview(rockButton)
        self.view.addSubview(scissorsButton)
        self.view.addSubview(paperButton)
        self.view.addSubview(resetButton)
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30),
            resultLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),

            comRPSLabel.topAnchor.constraint(equalTo: self.resultLabel.bottomAnchor, constant: 50),
            comRPSLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),

            scoreStackView.topAnchor.constraint(equalTo: self.comRPSLabel.bottomAnchor, constant: 80),
            scoreStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            scoreStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            comScoreLabel.leadingAnchor.constraint(equalTo: self.scoreStackView.leadingAnchor, constant: 20),
            comScoreLabel.trailingAnchor.constraint(equalTo: scoreStackView.centerXAnchor, constant: -20),
            comScoreLabel.widthAnchor.constraint(equalToConstant: 50),
            comScoreLabel.heightAnchor.constraint(equalToConstant: 50),
            
            userScoreLabel.leadingAnchor.constraint(equalTo: scoreStackView.centerXAnchor, constant: 20),
            userScoreLabel.trailingAnchor.constraint(equalTo: scoreStackView.trailingAnchor, constant: -20),
            userScoreLabel.widthAnchor.constraint(equalToConstant: 50),
            userScoreLabel.heightAnchor.constraint(equalToConstant: 50),
            
            rockButton.topAnchor.constraint(equalTo: scoreStackView.bottomAnchor, constant: 70),
            rockButton.trailingAnchor.constraint(equalTo: scissorsButton.leadingAnchor, constant: -10),
            
            scissorsButton.topAnchor.constraint(equalTo: scoreStackView.bottomAnchor, constant: 70),
            scissorsButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            paperButton.topAnchor.constraint(equalTo: scoreStackView.bottomAnchor, constant: 70),
            paperButton.leadingAnchor.constraint(equalTo: scissorsButton.trailingAnchor, constant: 10),
            
            resetButton.topAnchor.constraint(equalTo: scissorsButton.bottomAnchor, constant: 70),
            resetButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.widthAnchor.constraint(equalToConstant: 120),
        ])
    }
    
    @objc func rpsButtonTapped(sender: UIButton) {
        guard !(userScore > 2 || comScore > 2) else { return }
        comRPSLabel.text = rpsArray.randomElement()?.rawValue
        let resultString = rpsResult(value1: sender.titleLabel?.text, value2: comRPSLabel.text)
        resultLabel.text = resultString
        if resultString == "Win" {
            userScore += 1
        } else if resultString == "Lose" {
            comScore += 1
        }
        
    }
    
    @objc func resetButtonTapped(sender: UIButton) {
        resultLabel.text = "한번 이겨봐"
        comRPSLabel.text = "?"
        comScore = 0
        userScore = 0
    }
}
