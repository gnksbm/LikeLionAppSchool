//
//  RPSModel.swift
//  RockPaperScissorsKit
//
//  Created by gnksbm on 2023/06/26.
//

import Foundation

enum Rps: String {
    case rock = "✊🏻", scissors = "✌🏻", paper = "🖐🏻"
    
    var intValue: Int {
        switch self {
        case .rock:
            return 0
        case .scissors:
            return 1
        case .paper:
            return 2
        }
    }
}
// 0, 1
// 1, 2
// 2, 0

func rpsResult(value1: Rps, value2: Rps) -> String {
    guard value1 != value2 else { return "Draw"}
    let result = value1.intValue - value2.intValue
    if result == -1 || result == 2 {
        return "Win"
    } else {
        return "Lose"
    }
}

let rpsArray: [Rps] = [.rock, .scissors, .paper]


