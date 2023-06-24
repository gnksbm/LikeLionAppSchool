//
//  ContentView.swift
//  MultipleChoiceQuizUI
//
//  Created by gnksbm on 2023/06/21.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State var hintButton = false
    @State var hintButtonString = "Hint"
    @State var hwansAccount = ""
    @State var showAccount = false
    @State var answerArray = quizArray[Quiz.quizNumber - 1].choices.shuffled()
    @State var isTear = false
    
    let speechSynth = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            if Quiz.level == 1 {
                HStack {
                    Group {
                        if Quiz.quizNumber != 1 {
                            Button(action: {
                                Quiz.quizNumber -= 1
                                answerArray = quizArray[Quiz.quizNumber - 1].choices.shuffled()
                                let remove = Quiz.isCorrectAnswers.remove(at: Quiz.isCorrectAnswers.endIndex - 1)
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
                        }
                        Spacer()
                        Text("score \(Quiz.score)")
                            .foregroundColor(Color("HwanTintColor"))
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding()
                    }
                }
                Text("경환 연애 시뮬레이션")
                    .foregroundColor(Color("HwanTintColor"))
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
                if isTear {
                    Group {
                        HStack {
                            Raindrop()
                                .frame(width: 16, height: 32)
                                .offset(x: 90, y: 33)
                            Raindrop()
                                .frame(width: 8, height: 16)
                                .offset(x: 130, y: 42)
                        }
                        Bloodrop()
                            .frame(width: 4, height: 26)
                            .offset(x: 115, y: 30)
                    }
                }
                Spacer()
                ProgressView("\(Quiz.quizNumber) / \(quizArray.count)", value: Double(Quiz.quizNumber), total: Double(quizArray.count))
                    .accentColor(Color("HwanTintColor"))
                    .padding()
                    .foregroundColor(.white)
                Group {
                    if Quiz.quizNumber != quizArray.count {
                        Text(quizArray[Quiz.quizNumber - 1].question)
                            .padding()
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .shadow(radius: 5)
                            .shadow(color: .white, radius: 5)
                        ForEach(answerArray, id: \.self) { choice in
                            Button(choice) {
                                let result = choice == quizArray[Quiz.quizNumber - 1].correctChoice
                                if result {
                                    let speechString = AVSpeechUtterance(string: "나이스")
                                    speechSynth.speak(speechString)
                                } else {
                                    let speechString = AVSpeechUtterance(string: "땡")
                                    speechSynth.speak(speechString)
                                }
                                isTear = !result
                                if Quiz.quizNumber < 10 {
                                    Quiz.isCorrectAnswers.append(result)
                                    Quiz.quizNumber += 1
                                    answerArray = quizArray[Quiz.quizNumber - 1].choices.shuffled()
                                }
                            }
                            .foregroundColor(.white)
                        }
                        .frame(width: 310)
                        .padding()
                        .shadow(radius: 5)
                        .shadow(color: .white, radius: 5)
                        .background(LinearGradient(gradient: Gradient(colors: [.clear, Color("HwanTintColor")]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(15.0)
                        .foregroundColor(.white)
                    } else {
                        Text("다음 단계로 넘어가세요")
                            .foregroundColor(.white)
                            .font(.title2)
                        HStack {
                            Spacer()
                            Button("Reset") {
                                Quiz.resetQuiz()
                            }
                            .foregroundColor(.white)
                            Spacer()
                            Button("Next Level") {
                                Quiz.level += 1
                            }
                            .foregroundColor(Color("HwanTintColor"))
                            Spacer()
                        }
                        .fontWeight(.heavy)
                        .padding()
                        
                    }
                }
                Spacer()
            } else {
                if !showAccount {
                    Spacer()
                } else {
                    P275_Raining()
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
                    showAccount = true
                    
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
