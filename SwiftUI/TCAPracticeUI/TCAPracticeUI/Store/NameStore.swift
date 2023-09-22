//
//  NameStore.swift
//  TCAPracticeUI
//
//  Created by gnksbm on 2023/09/15.
//

import Foundation
import ComposableArchitecture

struct NameStore: Reducer {
    struct State: Equatable {
        var name: String = "GN"
    }
    
    enum Action {
        case change(name: String)
        case reset
    }
    
    func reduce(into state: inout State, action: Action) -> ComposableArchitecture.Effect<Action> {
        switch action {
        case .change(let change):
            guard change != "" else { return .none }
            state.name = change
            return .none
        case .reset:
            state.name = "GN"
            return .none
        }
    }
}





final class NameViewModel: ObservableObject {
    @Published var name: String = "GN"
    
    func changeName(name: String) {
        guard name != "" else { return }
        self.name = name
    }
    
    func resetName() {
        name = ""
    }
}
