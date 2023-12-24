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
    
    public var successedFetch = PublishSubject<[SearchLocationEntity]>()
    
    public init(repository: SearchLocationRepository) {
        self.repository = repository
    }
    
    public func searchLocation(request: SearchLocationRequest) {
        repository.fetchLocation(request: request)
            .withUnretained(self)
            .subscribe { useCase, result in
                useCase.successedFetch.onNext(result)
            }
            .disposed(by: disposeBag)
    }
}
