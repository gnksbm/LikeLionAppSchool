//
//  LocalNotiView.swift
//  NotificationUI
//
//  Created by gnksbm on 2023/09/16.
//

import SwiftUI

struct LocalNotiView: View {
    @StateObject private var notiManager = NotificationManager.shared
    
    var body: some View {
        VStack {
            Group {
                Button("누르고 5초 뒤에 로컬 노티!") {
                    notiManager.makeNoti()
                }
                Button("권한요청버튼") {
                    notiManager.requestAllow()
                }
            }
            .foregroundStyle(.primary)
            .bold()
            .padding(.horizontal)
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.primary, lineWidth: 1)
            }
            .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotiView()
    }
}
