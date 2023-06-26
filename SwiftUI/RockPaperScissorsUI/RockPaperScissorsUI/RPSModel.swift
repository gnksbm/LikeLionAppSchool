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

func rpsResult(value1: String?, value2: String?) -> String {
    guard let value1,
          let myRps = Rps(rawValue: value1),
          let value2,
          let comRps = Rps(rawValue: value2) else { return "Error" }
    
    guard value1 != value2 else { return "Draw"}
    let result = myRps.intValue - comRps.intValue
    if result == -1 || result == 2 {
        return "Win"
    } else {
        return "Lose"
    }
}

let rpsArray: [Rps] = [.rock, .scissors, .paper]


