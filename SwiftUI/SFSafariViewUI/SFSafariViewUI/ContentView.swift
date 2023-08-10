//
//  ContentView.swift
//  SFSafariViewUI
//
//  Created by gnksbm on 2023/08/03.
//

import SwiftUI

struct WebData: Identifiable {
    var id = UUID()
    var title: String
    var url: String
    var image = Image(systemName: "safari")
}

struct ContentView: View {
    @State var webDatas: [WebData] = [
        WebData(title: "swift", url: "https://developer.apple.com/documentation/swift"),
        WebData(title: "UIKit", url: "https://developer.apple.com/documentation/UIKit"),
        WebData(title: "SwfitUI", url: "https://developer.apple.com/documentation/swift"),
        WebData(title: "Github", url: "https://github.com/gnksbm"),
    ]
    @AppStorage("selection") var selection = 0
    
    var body: some View {
        ForEach(webDatas) { data in
            
        }
        TabView(selection: $selection) {
            ForEach(0..<webDatas.count) { index in
                WebView(urlString: webDatas[index].url)
                    .tabItem {
                        webDatas[index].image
                        Text(webDatas[index].title)
                    }
                    .tag(index)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
