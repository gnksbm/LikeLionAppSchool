//
//  UserStore.swift
//  TCAPracticeUI
//
//  Created by gnksbm on 2023/09/15.
//

import Foundation
import ComposableArchitecture

struct UserStore: Reducer {
    struct State: Equatable {
        var user: User
    }
    
    enum Action {
        case change(name: String)
        case print
    }
    
    func reduce(into state: inout State, action: Action) -> ComposableArchitecture.Effect<Action> {
        switch action {
        case .change(let change):
            return .none
        case .print:
            return .none
        }
    }
}
