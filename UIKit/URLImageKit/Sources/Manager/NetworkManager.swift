//
//  NetworkManager.swift
//  URLImageKit
//
//  Created by gnksbm on 2023/10/06.
//

import UIKit

enum NetworkError: Error {
    case transportError(Error)
    case invalidStatusCode
    case invalidData
}

final class NetworkManager {
    static let shared = NetworkManager()
    private let cacheManager = CacheManager<UIImage>()

    private init() { }

    func fetchImage(url: URL) async -> Result<UIImage, NetworkError> {
        if let cachedImage = cacheManager.loadImage(url: url) {
            return .success(cachedImage)
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse,
                  200..<300 ~= response.statusCode else {
                return .failure(.invalidStatusCode)
            }
            guard let image = UIImage(data: data) else { return .failure(.invalidData)}
            cacheManager.saveImage(url: url, data: image)
            return .success(image)
        } catch {
            return .failure(.transportError(error))
        }
    }
}
