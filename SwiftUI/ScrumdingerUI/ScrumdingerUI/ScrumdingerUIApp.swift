//
//  ScrumdingerUIApp.swift
//  ScrumdingerUI
//
//  Created by gnksbm on 2023/08/01.
//

import SwiftUI

@main
struct ScrumdingerUIApp: App {
    @State private var scrums = DailyScrum.sampleDatas
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
