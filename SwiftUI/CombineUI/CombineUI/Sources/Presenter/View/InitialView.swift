//
//  InitialView.swift
//  CombineUI
//
//  Created by gnksbm on 2023/10/29.
//

import SwiftUI

struct InitialView: View {
    @StateObject private var initialVM = InitialVM()
    @EnvironmentObject private var userRepo: UserRepository
    
    var body: some View {
        VStack {
            Button("로그인") {
                
            }
            .buttonStyle(.borderedProminent)
            .tint(.yellow)
            .font(.title)
            .bold()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
            .environmentObject(UserRepository())
    }
}
