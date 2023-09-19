//
//  LoginView.swift
//  ZenoPrototypeUI
//
//  Created by gnksbm on 2023/09/20.
//

import SwiftUI

struct LoginView: View {
    @Binding var isLogin: Bool
    var body: some View {
        NavigationStack {
            Button("카카오톡으로 로그인") {
                isLogin = true
            }
            .foregroundStyle(.background)
            .padding()
            .background(.yellow)
            .cornerRadius(5)
            .bold()
        }
//        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLogin: .constant(false))
    }
}
