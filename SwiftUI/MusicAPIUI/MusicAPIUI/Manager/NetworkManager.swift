//
//  NetworkManager.swift
//  MusicAPIUI
//
//  Created by gnksbm on 2023/08/14.
//

import Foundation

enum NetworkError: Error {
    case url, urlSession, decode
}

class NetworkManager {
    static let shared = NetworkManager()
    
    func request<T: Decodable>(urlString: String) async -> Result<T, NetworkError> {
        var data: Data
        guard let url = URL(string: urlString) else { return .failure(.url) }
        
        do {
            (data, _) = try await URLSession.shared.data(from: url)
        } catch {
            return .failure(.urlSession)
        }
        
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            return .success(result)
        } catch {
            return .failure(.decode)
        }
        
    }
    
    private init() { }
}
