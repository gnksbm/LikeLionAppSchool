//
//  ScoreView.swift
//  CalculatorUI
//
//  Created by gnksbm on 2023/06/29.
//

import SwiftUI

struct ScoreView: View {
    let teamName: String
    var isTop: Bool
    
    @State private var score: Int = 0
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .trim(from: 0.5, to: 1.0)
                    .stroke(.green, lineWidth: 70)
                    .rotationEffect(.degrees(isTop ? 180 : 0))
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        score += 3
                    }
                
                Circle()
                    .trim(from: 0.5, to: 1.0)
                    .stroke(.orange, lineWidth: 70)
                    .rotationEffect(.degrees(isTop ? 180 : 0))
                    .frame(width: 200, height: 200)
                    .onTapGesture {
                        score += 2
                    }
                
                Circle()
                    .trim(from: 0.5, to: 1.0)
                    .stroke(.red, lineWidth: 70)
                    .rotationEffect(.degrees(isTop ? 180 : 0))
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        score += 1
                    }
            }
            Text("\(teamName): \(score)")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .padding(.top, isTop ? 60 : -430)
                .padding()
                .minimumScaleFactor(0.5)
                .lineLimit(1)
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(teamName: "연습팀",isTop: true)
    }
}
