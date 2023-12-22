//
//  EndPoint.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/18.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

public protocol EndPoint {
    var baseURL: URL? { get }
    var header: [String: String] { get }
    var path: String { get }
    var queryParameter: [String: String] { get }
    var method: HTTPMethod { get }
}

extension EndPoint {
    func toURLRequest() -> URLRequest? {
        guard let baseURL else { return nil }
        let currentURL = baseURL
            .appending(path: path)
            .appending(
                queryItems: queryParameter.map { .init(name: $0, value: $1) }
            )
        var request = URLRequest(url: currentURL)
        request.httpMethod = method.toString
        request.allHTTPHeaderFields = header
        return request
    }
}
