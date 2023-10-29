//
//  ContentView.swift
//  KakaoShareLinkUI
//
//  Created by gnksbm on 2023/10/16.
//

import SwiftUI

struct ContentView: View {
    let service = KakaoService()
    
    var body: some View {
        Button {
            service.kakao()
        } label: {
            Text("카카오톡 공유하기")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
