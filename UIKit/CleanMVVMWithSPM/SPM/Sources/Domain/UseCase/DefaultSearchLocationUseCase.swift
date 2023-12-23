//
//  DefaultSearchLocationUseCase.swift
//  
//
//  Created by gnksbm on 2023/12/23.
//

import Foundation

import RxSwift

public final class DefaultSearchLocationUseCase: SearchLocationUseCase {
    let repository: SearchLocationRepository
    
    public init(repository: SearchLocationRepository) {
        self.repository = repository
    }
    
    public func searchLocation(
        query: String,
        display: Int?,
        start: Int?,
        sort: String?
    ) -> Observable<[Restaurant]> {
        repository.fetchLocation(
            query: query,
            display: display,
            start: start,
            sort: sort
        )
    }
}
