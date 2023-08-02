//
//  LandmarkUIApp.swift
//  LandmarkUI
//
//  Created by gnksbm on 2023/07/31.
//

import SwiftUI

@main
struct LandmarkUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ModelData())
        }
    }
}
