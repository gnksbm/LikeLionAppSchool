//
//  QuizData.swift
//  MultipleChoiceQuizUI
//
//  Created by gnksbm on 2023/06/21.
//

import Foundation

struct Quiz: Identifiable {
    static var quizNumber: Int = 1
    static var score: Int = 0
    static var isCorrectAnswers: [Bool] = [] {
        didSet {
            var score = 0
            for isCorrectAnswer in isCorrectAnswers {
                if isCorrectAnswer {
                    score += 1
                }
                self.score = score
            }
        }
    }
//    static var level: Int = 1
    
    var id:UUID = UUID()
    var question: String
    var choices: [String]
    var correctChoice: String
    
    init(question: String, choices: [String], correctChoice: String) {
        self.question = question
        self.choices = choices
        self.correctChoice = correctChoice
        self.choices.append(correctChoice)
    }
}

var quizArray: [Quiz] = [
    Quiz(question: "드디어 내일 애인과 첫 데이트를 하는 날이다. 애인에게 어떻게 연락할까?", choices: ["내일 우리 첫 데이트야! 너무 설렌다~! ㅎㅎ", "내일 집 앞으로 데리러 가도 될까?", "오빠 차 뽑았어 여행가자"], correctChoice: "내일 00역 앞에서 기다릴게!"),
    Quiz(question: "내일 데이트는 어떤 식으로 흘러갈까?", choices: ["애인의 기분에 따라 바뀔 수도 있어!", "내일의 기분에 따라 데이트가 완성될 거야!"], correctChoice: "미리 계획한 대로 착착 진행될 예정"),
    Quiz(question: "첫 데이트니까 애인에게 잘 보이고 싶다!", choices: ["입 냄새를 없애주는 구강청결제", "애인이랑 나눠 쓸 핸드크림"], correctChoice: "촉촉한 입술을 위한 립밤"),
    Quiz(question: "영화 시작 1분 전, 애인이 약속 장소에 늦게 도착했다. 나의 반응은?", choices: ["늦기 전에 빨리 들어가자!", "30분 후 영화로 예약 변경해놨어!"], correctChoice: "팝콘은 내가 미리 사뒀어! ㅎㅎ"),
    Quiz(question: "예매한 영화를 보러 왔다. 어떤 장르의 영화를 보게 될까?", choices: ["심장이 빨리 뛰는 공포 영화", "가슴 설레는 로맨스 영화"], correctChoice: "장르보다는 예매율 1위인 영화"),
    Quiz(question: "애인의 기분이 좋지 않아 보인다. 당신의 행동은?", choices: ["애인 기분이 좋아지도록 애교를 부려본다", "애인이 먼저 이야기해 줄 때까지 기다린다"], correctChoice: "왜 기분이 좋지 않은지 직접 물어본다"),
    Quiz(question: "카페에 가려고 한다. 어떤 카페를 갈까?", choices: ["깔끔하고 넓은 공간의 프랜차이즈 카페", "디저트가 맛있는 포근한 카페"], correctChoice: "인스타그램 감성의 트렌디한 카페"),
    Quiz(question: "구경 가기로 했던 소품샵이 문을 닫았다. 당신의 행동은?", choices: ["길에서 본 다른 소품샵에 가는 건 어떤지 제안한다",  "애인에게 의견을 물어본다"], correctChoice: "그럴 줄 알고 두세 군데를 더 찾아뒀다"),
    Quiz(question: "함께 식사를 하러 가게 되었다. 같이 먹을 메뉴는?", choices: ["로맨틱한 분위기의 레스토랑에서 파스타",  "편한 분위기의 고깃집에서 삼겹살"], correctChoice: "깔끔한 분위기의 일식집에서 초밥"),
    Quiz(question: "같이 식사를 하다가 애인에게 한번 더 반하게 되었다. 당신이 반한 애인의 모습은?", choices: ["나를 세심하게 챙겨주는 모습",  "내가 고른 메뉴를 맛있게  먹는 모습"], correctChoice: "식당 직원에게 예의 바른 모습"),
]
