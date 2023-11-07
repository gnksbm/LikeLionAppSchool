//
//  Section.swift
//  URLImageKit
//
//  Created by gnksbm on 2023/11/07.
//  Copyright © 2023 https://github.com/gnksbm/LikeLionAppSchool. All rights reserved.
//

import UIKit

enum Section: CaseIterable {
    case image
    
    func getCompositionalSection() -> NSCollectionLayoutSection {
        switch self {
        case .image:
            let insetValue = CGFloat.screenWidth / 20
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
            )
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(1)
                ), subitems: [item])
            group.contentInsets = .init(top: insetValue, leading: insetValue, bottom: insetValue, trailing: insetValue)
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: insetValue, leading: insetValue, bottom: insetValue, trailing: insetValue)
            return section
        }
    }
}
