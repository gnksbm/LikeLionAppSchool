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
    
    var answerArray = quizArray[Quiz.quizNumber - 1].choices.shuffled()
    
    lazy var buttonTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        // 셀 사이의 구분선 없애기
        tableView.separatorStyle = .none
        tableView.register(ButtonTVCell.self, forCellReuseIdentifier: ButtonTVCell.identifier)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
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
    }
    
    func setColor() {
        backButton.tintColor = .white
        subTitleLabel.textColor = .white
        hintButton.tintColor = .white
    }
    
    func configureUI() {
        buttonTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.insertSubview(imageView, at: 0)
        self.view.addSubview(buttonTableView)
        
        NSLayoutConstraint.activate([
            buttonTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            buttonTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            buttonTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10),
            buttonTableView.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 10),
            
            imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        guard Quiz.quizNumber > 1 else { return }
        Quiz.quizNumber -= 1
        let remove = Quiz.isCorrectAnswers.remove(at: Quiz.isCorrectAnswers.endIndex - 1)
        if remove {
            Quiz.score -= 1
        }
        buttonTableView.reloadData()
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
        let result = quizArray[Quiz.quizNumber - 1].correctChoice == answerArray[indexPath.row]
        if Quiz.quizNumber < 10 {
            if result {
                let speechString = AVSpeechUtterance(string: "나이스")
                speechSynth.speak(speechString)
            } else {
                let speechString = AVSpeechUtterance(string: "땡")
                speechSynth.speak(speechString)
            }
            Quiz.isCorrectAnswers.append(result)
            Quiz.quizNumber += 1
        }
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let questionLabel: UILabel = {
            let label = UILabel()
            label.text = quizArray[Quiz.quizNumber - 1].question + "\n"
            label.numberOfLines = 0
            label.font = .boldSystemFont(ofSize: 18)
            label.textAlignment = .center
            return label
        }()
        return questionLabel
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        answerArray = quizArray[Quiz.quizNumber - 1].choices.shuffled()
        return answerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        answerArray = quizArray[Quiz.quizNumber - 1].choices.shuffled()
        let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonTVCell", for: indexPath) as! ButtonTVCell
        cell.buttonCellLabel.text = answerArray[indexPath.row]
        self.scoreLabel.text = "score \(Quiz.score)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
}
