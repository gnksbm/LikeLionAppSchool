//
//  User.swift
//  CombineUI
//
//  Created by gnksbm on 2023/10/31.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    var name: String
    
    init(id: String = UUID().uuidString, name: String) {
        self.id = id
        self.name = name
    }
}

extension User {
    static let defaultUser: Self = .init(name: "Guest")
}
