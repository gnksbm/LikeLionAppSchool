//
//  DefaultSearchLocationRepository.swift
//  
//
//  Created by gnksbm on 2023/12/23.
//

import Foundation

import Network
import Domain

import RxSwift

public final class DefaultSearchLocationRepository: SearchLocationRepository {
    private let networkService: NetworkService
    
    public init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    public func fetchLocation(
        query: String,
        display: Int?,
        start: Int?,
        sort: String?
    ) -> Observable<[Restaurant]> {
        let endPoint = SearchLocationEndPoint(
            request: .init(
                query: query,
                display: display,
                start: start,
                sort: sort
            )
        )
        return networkService.rxFetch(endPoint: endPoint)
            .decode(type: SearchLocationDTO.self, decoder: JSONDecoder())
            .map { $0.toDomain }
    }
}
