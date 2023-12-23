//
//  SearchViewModel.swift
//  
//
//  Created by gnksbm on 2023/12/22.
//

import Foundation

import Domain

import RxSwift

public final class SearchViewModel: ViewModel {
    private let useCase: SearchLocationUseCase
    private let disposeBag = DisposeBag()
    
    public init(useCase: SearchLocationUseCase) {
        self.useCase = useCase
    }
    
    func transform(input: Input) -> Output {
        input.searchText.subscribe(onNext: { _ in
            
        }).disposed(by: disposeBag)
        input.searchBtnTapped.subscribe(onNext: { _ in
        }).disposed(by: disposeBag)
        return .init()
    }
}

extension SearchViewModel {
    struct Input {
        let searchText: Observable<String>
        let searchBtnTapped: Observable<Void>
    }
    
    struct Output {
        
    }
}
