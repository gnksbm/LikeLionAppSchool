//
//  ContentView.swift
//  XMLParsingUI
//
//  Created by gnksbm on 1/26/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var repository = FirstPartyRepository()
    
    var body: some View {
        TabView {
            FirstPartyView()
                .tabItem { Image(systemName: "1.circle") }
            ThirdPartyView()
                .tabItem { Image(systemName: "3.circle") }
        }
    }
}

#Preview {
    ContentView()
}
