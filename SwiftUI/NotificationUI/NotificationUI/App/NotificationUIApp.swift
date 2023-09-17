//
//  NotificationUIApp.swift
//  NotificationUI
//
//  Created by gnksbm on 2023/09/16.
//

import SwiftUI

@main
struct NotificationUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}


