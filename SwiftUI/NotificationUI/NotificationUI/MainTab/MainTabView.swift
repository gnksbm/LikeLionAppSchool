//
//  MainTabView.swift
//  NotificationUI
//
//  Created by gnksbm on 2023/09/17.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var tabVM: TabVM = .init()
    var body: some View {
        TabView(selection: $tabVM.selection) {
            ForEach(MainTab.allCases, id: \.rawValue) { tab in
                tab.view
                    .tabItem {
                        Text(tab.title)
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
