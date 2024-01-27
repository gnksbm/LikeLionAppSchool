//
//  CombineUIApp.swift
//  CombineUI
//
//  Created by gnksbm on 2023/10/29.
//

import SwiftUI

@main
struct CombineUIApp: App {
    @StateObject private var userRepo = UserRepository()
    
    var body: some Scene {
        WindowGroup {
            InitialView()
                .environmentObject(userRepo)
        }
    }
}
