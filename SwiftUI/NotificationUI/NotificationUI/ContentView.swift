//
//  ContentView.swift
//  NotificationUI
//
//  Created by gnksbm on 2023/09/16.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var notiManager = NotificationManager.shared
    
    var body: some View {
        VStack {
            Group {
                Button("노티!") {
                    notiManager.makeNoti()
                }
                Button("권한") {
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
        ContentView()
    }
}
