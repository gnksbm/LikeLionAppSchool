//
//  ContentView.swift
//  MultipleChoiceQuizUI
//
//  Created by gnksbm on 2023/06/21.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    // 퀴즈정보
    @State var quizNumber: Int = 1
    @State var score: Int = 0
    // isCorrect는 이전 문제로 가기 버튼을 사용해 돌아갈 때 스코어를 관리하기 위해 필요
    @State var isCorrect: [Bool] = []
    // 화면정보
    @State var goNextStep = false
    @State var hintButton = false
    @State var hintButtonString = "Hint"
    @State var hwansAccount = ""
    @State var getMoney = true
    
    let speechSynth = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            if !goNextStep {
                HStack {
                    Group {
                        Button(action: {
                            guard quizNumber > 1 else { return }
                            quizNumber -= 1
                            let remove = isCorrect.remove(at: isCorrect.endIndex - 1)
                            if remove {
                                score -= 1
                            }
                        }, label: {
                            Label {
                                Text("back")
                            } icon: {
                                Image(systemName: "chevron.backward.circle.fill")
                            }
                        })
                        .padding()
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(.bold)
                        Spacer()
                        Text("score \(score)")
                            .foregroundColor(.pink)
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding()
                    }
                }
                Text("경환 연애 시뮬레이션")
                    .foregroundColor(.pink)
                    .font(.title2)
                    .fontWeight(.bold)
                    .shadow(radius: 5)
                    .shadow(color: .white, radius: 5)
                Text("윤경환님은 무슨 답을 선택했을까요?")
                    .padding()
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Button(hintButtonString) {
                    hintButton.toggle()
                    if hintButton {
                        hintButtonString = "경환님의 mbti는 ENTJ입니다"
                    } else {
                        hintButtonString = "Hint"
                    }
                }
                
                .foregroundColor(.white)
                .fontWeight(.heavy)
                Spacer()
                ProgressView("\(quizNumber) / \(quizArray.count)", value: Double(quizNumber), total: Double(quizArray.count))
                    .accentColor(.pink)
                    .padding()
                    .foregroundColor(.white)
                Group {
                    if quizNumber != quizArray.count{
                        Text(quizArray[quizNumber - 1].question)
                            .padding()
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .shadow(radius: 5)
                            .shadow(color: .white, radius: 5)
                        ForEach(quizArray[quizNumber - 1].choices.shuffled(), id: \.self) { choice in
                            Button(choice) {
                                let result = choice == quizArray[quizNumber - 1].correctChoice
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
                            .foregroundColor(.white)
                            
                        }
                        .frame(width: 310)
                        .padding()
                        .shadow(radius: 5)
                        .shadow(color: .white, radius: 5)
                        .background(LinearGradient(gradient: Gradient(colors: [.clear, .pink]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(15.0)
                        .foregroundColor(.white)
                    } else {
                        Text("다음 단계로 넘어가세요")
                            .foregroundColor(.white)
                            .font(.title2)
                        Button("Next Level") {
                            goNextStep = true
                        }
                            .padding()
                            .foregroundColor(.pink)
                    }
                }
                Spacer()
            } else {
                P275_Raining()
                if getMoney {
                    Spacer()
                }
                Text("다음 단계를 하시려면 결제해주세요")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                Button("$5,000") {
                    hwansAccount = "카카오뱅크\n103-5932-139058\n윤경환"
                    getMoney = false
                    
                }
                .padding()
                .font(.largeTitle)
                .foregroundColor(.black)
                .frame(width: 145, height: 50)
                .background(.green)
                .cornerRadius(10)
                .multilineTextAlignment(.center)
                Spacer()
                Text(hwansAccount)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
            }
        }
        .background(Image("hwan"))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
