//
//  TCAPracticeUIApp.swift
//  TCAPracticeUI
//
//  Created by gnksbm on 2023/09/15.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCAPracticeUIApp: App {
    var body: some Scene {
        WindowGroup {
            TCAView(
                store: Store(initialState: NameStore.State()) {
                  NameStore()
              }
            )
        }
    }
}
