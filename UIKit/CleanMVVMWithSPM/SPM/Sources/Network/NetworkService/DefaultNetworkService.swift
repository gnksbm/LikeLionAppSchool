//
//  DefaultNetworkService.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/18.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

import RxSwift

public final class DefaultNetworkService: NetworkService {
    public init() { }
    
    public func fetch(endPoint: EndPoint) async throws -> Data {
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
    
    public func fetch(endPoint: EndPoint) -> Observable<Data> {
        return Observable<Data>.create { observer in
            guard let urlRequest = endPoint.toURLRequest() else {
                observer.onError(NetworkError.invalidURL)
                return Disposables.create()
            }
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                if let error {
                    observer.onError(error)
                }
                guard let httpResponse = response as? HTTPURLResponse,
                      200...299 ~= httpResponse.statusCode
                else {
                    observer.onError(NetworkError.invalidStatusCode)
                    return
                }
                guard let data
                else {
                    observer.onError(NetworkError.invalidData)
                    return
                }
                observer.onNext(data)
            }
            return Disposables.create()
        }
    }
}
