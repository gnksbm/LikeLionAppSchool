//
//  MyModel.swift
//  URLImageKit
//
//  Created by gnksbm on 2023/10/06.
//

import UIKit

struct MyModel: Identifiable, Hashable {
    let id: UUID
    var imageData: UIImage

    init(id: UUID = .init(), imageData: UIImage) {
        self.id = id
        self.imageData = imageData
    }
}

@propertyWrapper
struct ImageCacheWrapper {
    var url: String
    private let shared = NSCache<NSString, UIImage>()

    var wrappedValue: UIImage? {
        get {
            return shared.object(forKey: url as NSString)
        }
        set {
            guard let newValue else { return }
            shared.setObject(newValue, forKey: url as NSString)
        }
    }
}
