//
//  ViewController.swift
//  MultipleChoiceQuizKit
//
//  Created by gnksbm on 2023/06/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var headStackView: UIStackView!
    
    @IBOutlet weak var backButton: UIStackView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var hintButton: UIButton!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var questionTextView: UITextView!
    
    var buttonTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        return tableView
    }()
    
    var quizNumber: Int = 1
    var score: Int = 0
      // isCorrect는 이전 문제로 가기 버튼을 사용해 돌아갈 때 스코어를 관리하기 위해 필요
    var isCorrect: [Bool] = []
      // 화면정보
    var goNextStep = false
    var isHintButton = false
    var hintButtonString = "Hint"
    var hwansAccount = ""
    var showAccount = false
    
    let speechSynth = AVSpeechSynthesizer()
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = #imageLiteral(resourceName: "hwan")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setColor()
        configureUI()
        setData()
    }
    
    func setColor() {

        backButton.tintColor = .white
        subTitleLabel.textColor = .white
        hintButton.tintColor = .white
        questionTextView.backgroundColor = .clear
        questionTextView.textColor = .white
    }
    
    func configureUI() {
        buttonTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.insertSubview(imageView, at: 0)
        self.view.addSubview(buttonTableView)
        
        NSLayoutConstraint.activate([
            buttonTableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buttonTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100),
            buttonTableView.topAnchor.constraint(equalTo: questionTextView.bottomAnchor, constant: 20),
            
            imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    
    func setData() {
        buttonTableView.delegate = self
        buttonTableView.dataSource = self
        let buttonCellNib = UINib(nibName: "ButtonTVCell", bundle: nil)
        buttonTableView.register(buttonCellNib, forCellReuseIdentifier: "ButtonTVCell")
        questionTextView.text = quizArray[quizNumber - 1].question
            
    }
    
    func buttonTapped(sender: UIButton) {
        let result = sender.currentTitle == quizArray[quizNumber - 1].correctChoice
        if result {
            score += 1
            let speechString = AVSpeechUtterance(string: "나이스")
            speechSynth.speak(speechString)
        } else {
            let speechString = AVSpeechUtterance(string: "땡")
            speechSynth.speak(speechString)
        }
        if quizNumber < 10 {
            isCorrect.append(result)
            quizNumber += 1
        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        guard quizNumber > 1 else { return }
        quizNumber -= 1
        let remove = isCorrect.remove(at: isCorrect.endIndex - 1)
        if remove {
            score -= 1
        }
    }
    
    @IBAction func hintButtonTapped(_ sender: UIButton) {
        isHintButton.toggle()
        if isHintButton {
            hintButtonString = "경환님의 mbti는 ENTJ입니다"
        } else {
            hintButtonString = "Hint"
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let result = sender.currentTitle == quizArray[quizNumber - 1].correctChoice
//        if result {
//            score += 1
//            let speechString = AVSpeechUtterance(string: "나이스")
//            speechSynth.speak(speechString)
//        } else {
//            let speechString = AVSpeechUtterance(string: "땡")
//            speechSynth.speak(speechString)
//        }
//        if quizNumber < 10 {
//            isCorrect.append(result)
//            quizNumber += 1
//        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quizArray[quizNumber - 1].choices.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "ButtonTVCell", for: indexPath) as! ButtonTVCell
        cell.buttonCellLabel.text = quizArray[quizNumber - 1].choices[indexPath.row]
        return cell
    }
}
