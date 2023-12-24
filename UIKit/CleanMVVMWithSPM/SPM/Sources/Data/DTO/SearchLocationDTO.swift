//
//  SearchLocationDTO.swift
//  
//
//  Created by gnksbm on 2023/12/22.
//

import Foundation

import Domain

struct SearchLocationDTO: Codable {
    let lastBuildDate: String
    let total: Int
    let start: Int
    let display: Int
    let items: [Item]
    
    var toDomain: [SearchLocationEntity] {
        items.map {
            .init(
                title: $0.title,
                link: $0.link,
                category: $0.category,
                description: $0.description,
                telephone: $0.telephone,
                address: $0.address,
                roadAddress: $0.roadAddress,
                mapx: $0.mapx,
                mapy: $0.mapy
            )
        }
    }
}

extension SearchLocationDTO {
    struct Item: Codable {
        let title: String
        let link: String
        let category: String
        let description: String
        let telephone: String
        let address: String
        let roadAddress: String
        let mapx: String
        let mapy: String
    }
}
