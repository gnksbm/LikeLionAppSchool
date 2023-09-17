//
//  MainTab.swift
//  NotificationUI
//
//  Created by gnksbm on 2023/09/17.
//

import SwiftUI

enum MainTab: Int, CaseIterable {
    case local, push
    
    var title: String {
        switch self {
        case .local:
            return "Local"
        case .push:
            return "Push"
        }
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .local:
            LocalNotiView()
        case .push:
            PushNotiView()
        }
    }
}
