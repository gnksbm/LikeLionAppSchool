//
//  Tab.swift
//  VibeCloneKit
//
//  Created by gnksbm on 2023/08/11.
//

import UIKit

enum Tab: Int, CaseIterable {
    case today, chart, audio, search, store
    
    var info: VCInfo {
        switch self {
        case .today:
            return VCInfo(title: "투데이", ImgName: "house", selectedImgName: "house.fill", vc: TodayViewController())
        case .chart:
            return VCInfo(title: "차트", ImgName: "trophy", selectedImgName: "trophy.fill", vc: ChartViewController())
        case .audio:
            return VCInfo(title: "오디오", ImgName: "waveform.circle", selectedImgName: "waveform.circle.fill", vc: AudioViewController())
        case .search:
            return VCInfo(title: "검색", ImgName: "magnifyingglass", selectedImgName: "magnifyingglass", vc: SearchViewController())
        case .store:
            return VCInfo(title: "보관함", ImgName: "person", selectedImgName: "person.fill", vc: StorageViewController())
        @unknown case _:
            print("This is not defined case: \(self)")
            break
        }
    }

    struct VCInfo {
        var title: String
        var ImgName: String
        var selectedImgName: String
        var vc: UIViewController
    }
    
    static func makeAllCasesToViewControllers() -> [UINavigationController] {
        var viewControllers: [UINavigationController] = []
        Self.allCases.forEach {
            let viewController = UINavigationController(rootViewController: $0.info.vc)
            viewController.tabBarItem = UITabBarItem(title: $0.info.title, image: UIImage(systemName: $0.info.ImgName), tag: $0.rawValue)
            viewController.tabBarItem.selectedImage = UIImage(systemName: $0.info.selectedImgName)
            viewControllers.append(viewController)
        }
        return viewControllers
    }
}
