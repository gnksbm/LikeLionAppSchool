//
//  DefaultSearchLocationUseCase.swift
//  
//
//  Created by gnksbm on 2023/12/23.
//

import Foundation

import RxSwift

public final class DefaultSearchLocationUseCase: SearchLocationUseCase {
    private let repository: SearchLocationRepository
    private let disposeBag = DisposeBag()
    
    public var successedFetch = PublishSubject<[Restaurant]>()
    
    public init(repository: SearchLocationRepository) {
        self.repository = repository
    }
    
    public func searchLocation(
        query: String,
        display: Int?,
        start: Int?,
        sort: String?
    ) {
        repository.fetchLocation(
            query: query,
            display: display,
            start: start,
            sort: sort
        )
        .withUnretained(self)
        .subscribe { useCase, result in
            useCase.successedFetch.onNext(result)
        }
        .disposed(by: disposeBag)
    }
}
