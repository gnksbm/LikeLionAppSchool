//
//  UserDefault.swift
//  CombineUI
//
//  Created by gnksbm on 2023/10/31.
//

import SwiftUI

@propertyWrapper
struct UserDefault<T: Codable>: DynamicProperty {
    var key: String
    var defaultValue: T
    
    var wrappedValue: T {
        get {
            guard let data = UserDefaults.standard.object(forKey: key) as? Data,
                  let value = try? JSONDecoder().decode(T.self, from: data)
            else { return defaultValue }
            return value
        }
        nonmutating set {
            guard let data = try? JSONEncoder().encode(newValue) else { return }
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
}
