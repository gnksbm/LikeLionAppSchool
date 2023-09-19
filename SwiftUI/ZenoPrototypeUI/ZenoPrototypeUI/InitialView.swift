//
//  InitialView.swift
//  ZenoPrototypeUI
//
//  Created by gnksbm on 2023/09/20.
//

import SwiftUI

struct InitialView: View {
    @State private var isLogin = false
    
    init(isLogin: Bool = false) {
        self.isLogin = isLogin
        UITabBar.appearance().backgroundColor = .gray
    }
    var body: some View {
        VStack {
            if isLogin {
                MainTabView()
            } else {
                LoginView(isLogin: $isLogin)
            }
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
