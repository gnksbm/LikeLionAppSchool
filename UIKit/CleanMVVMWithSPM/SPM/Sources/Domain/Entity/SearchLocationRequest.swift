//
//  SearchLocationRequest.swift
//  
//
//  Created by gnksbm on 2023/12/24.
//

import Foundation

public struct SearchLocationRequest {
    public let query: String
    public let display: String?
    public let start: String?
    public let sort: String?
    
    public init(
        query: String = "",
        display: String? = nil,
        start: String? = nil,
        sort: String? = nil
    ) {
        self.query = query
        self.display = display
        self.start = start
        self.sort = sort
    }
    public var toQuery: [String: String] {
        var query = [String: String]()
        Mirror(reflecting: self)
            .children
            .forEach { key, value in
                guard let key,
                      let value = value as? String
                else { return }
                query[key] = value
            }
        return query
    }
}
