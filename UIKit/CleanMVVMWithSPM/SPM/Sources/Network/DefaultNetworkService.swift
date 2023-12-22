//
//  DefaultNetworkService.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/18.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

public final class DefaultNetworkService: NetworkService {
    public init() { }
    
    public func request(endPoint: EndPoint) async throws -> Data {
        guard let urlRequest = endPoint.toURLRequest() else {
            throw NetworkError.invalidURL
        }
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let httpResponse = response as? HTTPURLResponse,
                  200...299 ~= httpResponse.statusCode
            else {
                throw NetworkError.invalidStatusCode
            }
            return data
        } catch {
            throw NetworkError.transportError(error)
        }
    }
}
