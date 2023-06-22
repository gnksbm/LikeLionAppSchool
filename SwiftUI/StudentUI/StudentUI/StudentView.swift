//
//  StudentView.swift
//  StudentUI
//
//  Created by gnksbm on 2023/06/14.
//

import SwiftUI
import AVFoundation

struct StudentView: View {
    @State var name = "Select Name"
    @State var nameOrNickName = false
    @State var appendName = ""
    @State var appendNickName = ""
    
    let speechSynth = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            Button (name) {
                let speechUtterance = AVSpeechUtterance(string: name)
                speechSynth.speak(speechUtterance)
            }
            .padding()
            Form {
                Toggle(isOn: $nameOrNickName) {
                    Text("Name / NickName")
                }
                List(students) { student in
                    VStack {
                        nameOrNickName ?
                        Button (student.nickName) {
                            name = "Hi, \(student.nickName)"
                        } :
                        Button (student.name) {
                            name = "Hi, \(student.name)"
                        }
                    }
                }
                List {
                    HStack {
                        TextField("이름", text: $appendName)
                        TextField("닉네임", text: $appendNickName)
                    }
                    HStack {
                        Spacer()
                        Button("추가하기") {
                            studentsAppend {
                                let name = appendName
                                let nickName = appendNickName
                                return (name: name, nickName: nickName)
                            }
                        }
                    }
                }
            }
            
        }
        .padding()
        

    }
}

struct StudentView_Previews: PreviewProvider {
    static var previews: some View {
        StudentView()
    }
}
