//
//  Restaurant.swift
//  
//
//  Created by gnksbm on 2023/12/23.
//

import Foundation

public struct Restaurant: Codable {
    let title: String
    let link: String
    let category: String
    let description: String
    let telephone: String
    let address: String
    let roadAddress: String
    let mapx: String
    let mapy: String
    
    public init(
        title: String,
        link: String,
        category: String,
        description: String,
        telephone: String,
        address: String,
        roadAddress: String,
        mapx: String,
        mapy: String
    ) {
        self.title = title
        self.link = link
        self.category = category
        self.description = description
        self.telephone = telephone
        self.address = address
        self.roadAddress = roadAddress
        self.mapx = mapx
        self.mapy = mapy
    }
}
