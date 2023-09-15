//
//  TodayView+CollectionView.swift
//  VibeCloneKit
//
//  Created by gnksbm on 2023/08/12.
//

import UIKit

extension TodayView {
    func setDataSource() {
        // TODO: - cell을 UICollectionView.CellRegistration를 이용하여 dequeueConfiguredReusableCell로 변경,
        dataSource = .init(collectionView: todayCV, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SomeCell", for: indexPath)
            cell.layer.cornerRadius = 8
            cell.backgroundColor = .black
            return cell
        })
        setSnapshot()
        dataSource.apply(snapshot)
    }
    
    func setSnapshot() {
        snapshot = .init()
        snapshot.appendSections(TodaySection.allCases)
        TodaySection.allCases.forEach {
            snapshot.appendItems($0.testData.map({ $0.id }), toSection: $0)
        }
    }
    func makeLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { int, env in
            guard let todaySection = TodaySection(rawValue: int) else { print(#function + ": fail to optional bing section")
                return .preventError()
            }
            return todaySection.section
        }
    }
}

extension NSCollectionLayoutSection {
    static func preventError() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.9),
                heightDimension: .fractionalHeight(1/3)
            ), subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = .init(top: 0, leading: UIScreen.main.bounds.width / 20, bottom: 0, trailing: 0)
        return section
    }
}

//MARK: - Preview

import SwiftUI
struct TodayViewEx1_Preview: PreviewProvider {
    static var previews: some View {
        UIKitVCPreview {
            PreviewController()
        }
    }
}
