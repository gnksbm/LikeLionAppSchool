//
//  InitialVM.swift
//  CombineUI
//
//  Created by gnksbm on 2023/10/31.
//

import Foundation

class InitialVM: ObservableObject {
    @Published var status: SignState = .unsign
    
    init() {
        
    }
}

extension InitialVM {
    enum SignState: Codable {
        case unsign, signIn
    }
}
