//
//  ViewModel.swift
//  CombineUI
//
//  Created by gnksbm on 2023/10/29.
//

import SwiftUI
import Combine

final class UserRepository: ObservableObject {
    static let shared = UserRepository()
    
    @Published var user: User = .defaultUser
    
    private init() { }
}
