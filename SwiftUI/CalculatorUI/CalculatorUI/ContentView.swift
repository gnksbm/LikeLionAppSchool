//
//  ContentView.swift
//  CalculatorUI
//
//  Created by gnksbm on 2023/06/29.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Color.teal
                .edgesIgnoringSafeArea(.all)
            ScoreView(teamName: "뉴욕 양키스", isTop: true)
                .offset(y: CGFloat(-110))
                .frame(height: 460)
            ScoreView(teamName: "동두천 양키스", isTop: false)
                .offset(y: CGFloat(150))
            Color.teal
                .edgesIgnoringSafeArea(.all)
        }
        .background(.teal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
