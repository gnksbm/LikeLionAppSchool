//
//  SearchLocationEndPoint.swift
//  
//
//  Created by gnksbm on 2023/12/22.
//

import Foundation
import Core

public struct SearchLocationEndPoint: EndPoint {
    public var baseURL: URL? {
        URL(string: "https://openapi.naver.com/v1/search")
    }
    
    public var header: [String: String] {
        [
            "X-Naver-Client-Id": .naverID,
            "X-Naver-Client-Secret": .naverSecret
        ]
    }
    
    public var path: String {
        "local.json"
    }
    
    public var queryParameter: [String : String]
    
    public var method: HTTPMethod {
        .get
    }
    
    public init(queryParameter: [String : String]) {
        self.queryParameter = queryParameter
    }
}

extension SearchLocationEndPoint {
    public struct Request {
        let query: String
        let display: Int?
        let start: Int?
        let sort: String?
        
        var toQuery: [String: String] {
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
        
        public init(
            query: String,
            display: Int?,
            start: Int?,
            sort: String?
        ) {
            self.query = query
            self.display = display
            self.start = start
            self.sort = sort
        }
    }
}
