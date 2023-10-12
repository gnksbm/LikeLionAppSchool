//
//  NetworkManager.swift
//  URLImageKit
//
//  Created by gnksbm on 2023/10/06.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() { }
    
    func fetchData(url: URL) async -> Result<Data, Error> {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return .success(data)
        } catch {
            return .failure(error)
        }
    }
}
