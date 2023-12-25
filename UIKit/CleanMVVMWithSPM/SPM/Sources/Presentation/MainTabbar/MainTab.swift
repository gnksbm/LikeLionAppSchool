//
//  MainTab.swift
//  
//
//  Created by gnksbm on 2023/12/25.
//

import UIKit

enum MainTab: CaseIterable {
    case search
    
    var tabBarItem: UITabBarItem {
        switch self {
        case .search:
            return UITabBarItem(
                title: "검색",
                image: UIImage(systemName: "magnifyingglass.circle"),
                selectedImage: UIImage(systemName: "magnifyingglass.circle.fill")
            )
        }
    }
}
