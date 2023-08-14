//
//  ContentView.swift
//  MusicAPIUI
//
//  Created by gnksbm on 2023/08/14.
//

import SwiftUI

struct ContentView: View {
    @State var tabSelection = 1
    var body: some View {
        NavigationStack {
            NavigationLink {
                MusicView()
            } label: {
                Text("UIKit")
            }
            NavigationLink {
                MusicListViewSwiftUI()
            } label: {
                Text("SwiftUI")
            }

            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
