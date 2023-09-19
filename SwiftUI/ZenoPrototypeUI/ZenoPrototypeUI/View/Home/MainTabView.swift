//
//  MainTabView.swift
//  ZenoPrototypeUI
//
//  Created by gnksbm on 2023/09/20.
//

import SwiftUI

enum MainTab: CaseIterable {
    case home, vote, myPage
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .home:
            HomeView()
                .badge(24)
        case .vote:
            VoteView()
        case .myPage:
            MyPageView()
        }
    }
    
    @ViewBuilder
    var tabItem: some View {
        switch self {
        case .home:
            Image(systemName: "house")
        case .vote:
            Image(systemName: "checkmark.circle")
        case .myPage:
            Image(systemName: "house")
        }
    }
}
struct MainTabView: View {
    @State private var selection: Int = 0
    @State private var visibility: Visibility = .visible
    var body: some View {
        TabView(selection: $selection) {
            ForEach(MainTab.allCases, id: \.self) { tab in
                tab.view
                    .tabItem {
                        tab.tabItem
                    }
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
