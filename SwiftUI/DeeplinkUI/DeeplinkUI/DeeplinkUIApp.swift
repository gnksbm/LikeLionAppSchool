//
//  DeeplinkUIApp.swift
//  DeeplinkUI
//
//  Created by gnksbm on 2023/10/08.
//

import SwiftUI

@main
struct DeeplinkUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}




enum TabIdentifier: Hashable {
    case todos
    case profile
}

// Showing page identifier
enum PageIdentifier: Hashable {
    case todoItem(id: UUID)
}

extension URL {
    // check scheme is same with URL scheme set in info section.
    var isDeepLink: Bool {
        return scheme == "hi-hello"
    }
    
    // case "todos" -> hi-hello://todos
    // case "profile" -> hi-hello://profile
    var tabIdentifier: TabIdentifier? {
        guard isDeepLink else { return nil }
        
        switch host {
        case "todos":
            return .todos
        case "profile":
            return .profile
        default:
            return nil
        }
    }
    
    // Move to detail page with activeUUID(52th line of TodosView.swift)
    // hi-hello://profile/activeUUID
    var detailPage: PageIdentifier? {
        guard let tabId = tabIdentifier,
              pathComponents.count > 1,
              let uuid = UUID(uuidString: pathComponents[1])
        else { return nil }
        
        switch tabId {
        case .todos:
            return .todoItem(id: uuid)
        default:
            return nil
        }
    }
}
