//
//  ViewController.swift
//  RandomOXQuizKit_NoSB
//
//  Created by gnksbm on 2023/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    let quizView = QuizView()
    
    //MARK: - Data
    var randomNumber1: Int = Int.random(in: 1...10) {
        didSet {
            quizView.multiplicationLabel.text = "\(randomNumber1) * \(randomNumber2) = \(randomNumber3)"
        }
    }
    var randomNumber2: Int = Int.random(in: 1...10)
    var randomNumber3: Int = Int.random(in: 1...100)
    
    var isCorrect: Bool {
        randomNumber1 * randomNumber2 == randomNumber3
    }
    
    var correctCount: Int = 0 {
        didSet {
            quizView.correctCountLabel.text = "정답 개수 \(correctCount)"
            randomNumber1 = Int.random(in: 1...10)
            randomNumber2 = Int.random(in: 1...10)
            
            if Int.random(in: 0...1) == 0 {
                randomNumber3 = randomNumber1 * randomNumber2
            } else {
                randomNumber3 = Int.random(in: 1...100)
            }
        }
    }
    
    var inCorrectCount: Int = 0 {
        didSet {
            quizView.inCorrectCountLabel.text = "오답 개수 \(inCorrectCount)"
            randomNumber1 = Int.random(in: 1...10)
            randomNumber2 = Int.random(in: 1...10)
            
            if Int.random(in: 0...1) == 0 {
                randomNumber3 = randomNumber1 * randomNumber2
            } else {
                randomNumber3 = Int.random(in: 1...100)
            }
        }
    }
    
    var totalCount = 0 {
        didSet {
            if totalCount == 10 {
                quizView.oButton.isEnabled = false
                quizView.xButton.isEnabled = false
                quizView.oButton.setTitleColor(.gray, for: .disabled)
                quizView.xButton.setTitleColor(.gray, for: .disabled)
                quizView.multiplicationLabel.text = "정답: \(correctCount)개 오답: \(inCorrectCount)개"
                guard let text = quizView.messageLabel.text else { return }
                quizView.messageLabel.text = text + " 10문제를 다 푸셨습니다."
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    func configureUI() {
        self.view.addSubview(quizView.multiplicationLabel)
        self.view.addSubview(quizView.correctCountLabel)
        self.view.addSubview(quizView.inCorrectCountLabel)
        self.view.addSubview(quizView.messageLabel)
        self.view.addSubview(quizView.oButton)
        self.view.addSubview(quizView.xButton)
        self.view.addSubview(quizView.resetButton)
        
        NSLayoutConstraint.activate([
            quizView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    
    
    @objc func oButtonTapped(_ sender: UIButton) {
        if isCorrect {
            quizView.messageLabel.text = "정답입니다"
            self.correctCount += 1
        } else {
            quizView.messageLabel.text = "오답입니다"
            self.inCorrectCount += 1
        }
    }
    @objc func xButtonTapped(_ sender: UIButton) {
        if !isCorrect {
            quizView.messageLabel.text = "정답입니다"
            self.correctCount += 1
        } else {
            quizView.messageLabel.text = "오답입니다"
            self.inCorrectCount += 1
        }
    }
    @objc func resetButtonTapped(_ sender: UIButton) {
    }
}

