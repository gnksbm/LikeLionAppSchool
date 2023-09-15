//
//  TodayModel.swift
//  VibeCloneKit
//
//  Created by gnksbm on 2023/08/12.
//

import UIKit

struct ModernCVData: Identifiable {
    var id = UUID()
}

enum TodaySection: Int, CaseIterable {
    case main, mixtape, likedArtist, recentAlbum, suggestionAI, suggestionAlbum, suggestionPlaylist, partyRoom, recentlyPlayed, mytaste, suggestionVIBE, recentSong
    
    var headerMessage: String {
        //    switch self {
        //    case .main, .mixtape, .likedArtist, .recentAlbum, .suggestionAI, .suggestionAlbum, .suggestionPlaylist, .partyRoom, .recentlyPlayed, .mytaste, .suggestionVIBE, .recentSong:
        //        return 0
        //    }
        return "헤더"
    }
    
    var column: CGFloat {
        switch self {
        case .main, .likedArtist, .suggestionPlaylist, .partyRoom, .recentlyPlayed, .suggestionVIBE, .recentSong:
            return 1
        case .mixtape, .recentAlbum, .suggestionAI, .suggestionAlbum, .mytaste:
            return 2
        }
    }
    var row: CGFloat {
        switch self {
        case .main, .partyRoom, .suggestionVIBE, .mixtape, .recentAlbum, .suggestionAI, .suggestionAlbum, .mytaste:
            return 1
        case .likedArtist, .suggestionPlaylist:
            return 3
        case .recentlyPlayed, .recentSong:
            return 5
        }
    }
    var width: CGFloat {
        switch self {
        case .main, .mixtape, .recentAlbum, .suggestionAI, .suggestionAlbum, .recentlyPlayed, .mytaste, .suggestionVIBE, .recentSong:
            return 0.9
        case .likedArtist, .suggestionPlaylist:
            return 0.8
        case .partyRoom:
            return 0.7
        }
    }
    var height: NSCollectionLayoutDimension {
        switch self {
        case .main, .mixtape, .likedArtist, .recentAlbum, .suggestionAI, .suggestionAlbum, .suggestionPlaylist, .mytaste:
            return .fractionalHeight(1/3)
        case .partyRoom:
            return .fractionalHeight(1/5)
        case .recentlyPlayed, .recentSong:
            return .fractionalHeight(5/9)
        case .suggestionVIBE:
            return .fractionalWidth(1)
        }
    }
    var scrolltype: UICollectionLayoutSectionOrthogonalScrollingBehavior {
        switch self {
        case .main, .likedArtist, .suggestionPlaylist, .recentlyPlayed, .suggestionVIBE, .recentSong:
            return .groupPaging
            // TODO: - mixtape itemd을 group으로 전환해야 애니메이션이 정상작동함
        case .mixtape, .recentAlbum, .suggestionAI, .suggestionAlbum, .partyRoom, .mytaste:
            return .continuousGroupLeadingBoundary
        }
    }
    
    var testData: [ModernCVData] {
        return [ModernCVData(), ModernCVData(), ModernCVData(), ModernCVData(), ModernCVData(), ModernCVData(), ModernCVData(), ModernCVData(), ModernCVData(), ModernCVData()]
    }
}

extension TodaySection {
    var itemInset: NSDirectionalEdgeInsets {
        return .init(top: 5, leading: 5, bottom: 5, trailing: 5)
    }
    var item: NSCollectionLayoutItem {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1 / column),
                heightDimension: .fractionalHeight(1 / row)
            )
        )
        item.contentInsets = itemInset
        return item
    }
    var group: NSCollectionLayoutGroup {
        switch row {
        case 1:
            return .horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(width),
                    heightDimension: height
                ), subitems: [item]
            )
        default:
            return .vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(width),
                    heightDimension: height
                ), subitems: [item]
            )
        }
    }
    
    var sectionInset: NSDirectionalEdgeInsets {
        return .init(top: 0, leading: UIScreen.main.bounds.width / 20, bottom: 0, trailing: 0)
    }
    var section: NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = scrolltype
        section.contentInsets = sectionInset
        return section
    }
}
