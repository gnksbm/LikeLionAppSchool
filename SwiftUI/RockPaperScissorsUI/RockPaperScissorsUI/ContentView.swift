//
//  ContentView.swift
//  RockPaperScissorsUI
//
//  Created by gnksbm on 2023/06/26.
//

import SwiftUI

struct ContentView: View {
    @State var viewColor = Color(.white)
    @State var comScore = 0 {
        didSet {
            if comScore > 2 {
                resultString = "조금 더 분발 하도록 🙏"
            }
        }
    }
    @State var userScore = 0 {
        didSet {
            if userScore > 2 {
                resultString = "좀 치네?.."
            }
        }
    }
    @State var resultString = "한번 이겨봐"
    @State var comRpsString = "?"
    var body: some View {
        VStack {
            Text(resultString)
                .fontWeight(.bold)
                .font(.largeTitle)
            Spacer()
            Text(comRpsString)
                .fontWeight(.bold)
                .font(.largeTitle)
            Spacer()
            HStack {
                Text("컴퓨터: \(comScore)")
                Spacer()
                Text("사용자: \(userScore)")
            }
            .fontWeight(.bold)
            .font(.largeTitle)
            .padding()
            HStack {
                ForEach(rpsArray, id: \.self) { item in
                    Button(item.rawValue) {
                        guard !(userScore > 2 || comScore > 2) else { return }
                        comRpsString = rpsArray.randomElement()?.rawValue ?? "Error"
                        let resultString = rpsResult(value1: item.rawValue, value2: comRpsString)
                        self.resultString = resultString
                        if resultString == "Win" {
                            userScore += 1
                            viewColor = .green
                        } else if resultString == "Lose" {
                            comScore += 1
                            viewColor = .red
                        } else if resultString == "Draw" {
                            viewColor = .cyan
                        }
                    }
                    .font(.largeTitle)
                }
            }
            .padding()
            Spacer()
            Button("Reset") {
                resultString = "한번 이겨봐"
                comRpsString = "?"
                comScore = 0
                userScore = 0
            }
            .fontWeight(.bold)
            .font(.largeTitle)
            .foregroundColor(.black)
            Spacer()
        }
        .padding()
        .background(viewColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
