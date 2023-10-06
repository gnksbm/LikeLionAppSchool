//
//  MyModel.swift
//  URLImageKit
//
//  Created by gnksbm on 2023/10/06.
//

import Foundation

struct MyModel: Identifiable, Hashable {
    let id: UUID
    var imageData: Data
    
    init(id: UUID = .init(), imageData: Data) {
        self.id = id
        self.imageData = imageData
    }
}
