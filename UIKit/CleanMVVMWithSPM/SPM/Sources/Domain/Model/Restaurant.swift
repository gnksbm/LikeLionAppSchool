//
//  Restaurant.swift
//  
//
//  Created by gnksbm on 2023/12/23.
//

import Foundation

public struct Restaurant: Codable {
    public let title: String
    public let link: String
    public let category: String
    public let description: String
    public let telephone: String
    public let address: String
    public let roadAddress: String
    public let mapx: String
    public let mapy: String
    
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
