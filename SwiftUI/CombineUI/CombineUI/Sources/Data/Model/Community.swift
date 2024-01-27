//
//  Community.swift
//  CombineUI
//
//  Created by gnksbm on 2023/10/31.
//

import Foundation

struct Community: Identifiable, Codable {
    let id: String
    var name: String
    
    init(id: String = UUID().uuidString, name: String) {
        self.id = id
        self.name = name
    }
}

extension Community {
    static let defaultComm: Self = .init(name: "default")
}
