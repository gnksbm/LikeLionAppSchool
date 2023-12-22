//
//  SearchLocationEndPoint.swift
//  
//
//  Created by gnksbm on 2023/12/22.
//

import Foundation
import Core

struct SearchLocationEndPoint: EndPoint {
    var baseURL: URL? {
        URL(string: "https://openapi.naver.com/v1/search/local.json")
    }
    
    var header: [String: String] {
        [
            "X-Naver-Client-Id": .naverID,
            "X-Naver-Client-Secret": .naverSecret
        ]
    }
    
    var path: String {
        ""
    }
    
    var queryParameter: [String : String]
    
    var method: HTTPMethod {
        .get
    }
    
    init(request: Request) {
        self.queryParameter = request.toQuery
    }
}

extension SearchLocationEndPoint {
    struct Request {
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
    }
}
