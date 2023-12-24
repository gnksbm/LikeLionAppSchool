//
//  SearchViewModel.swift
//  
//
//  Created by gnksbm on 2023/12/22.
//

import Foundation

import Domain

import RxSwift
import RxRelay

public final class SearchViewModel: ViewModel {
    private let useCase: SearchLocationUseCase
    private let disposeBag = DisposeBag()
    
    private let searchTerm = BehaviorRelay<String>(value: "")
    
    public init(useCase: SearchLocationUseCase) {
        self.useCase = useCase
    }
    
    func transform(input: Input) -> Output {
        let output = Output()
        
        useCase.successedFetch
            .subscribe(onNext: { result in
                output.fetchedRestaurant.accept(result)
            })
            .disposed(by: disposeBag)
        
        input.searchTerm
            .withUnretained(self)
            .subscribe(onNext: { viewModel, term in
                viewModel.searchTerm.accept(term)
            }).disposed(by: disposeBag)
        
        input.searchBtnTapped
            .withUnretained(self)
            .subscribe(onNext: { viewModel, _ in
                viewModel.useCase.searchLocation(
                    query: viewModel.searchTerm.value,
                    display: nil,
                    start: nil,
                    sort: nil
                )
            }).disposed(by: disposeBag)
        
        return output
    }
}

extension SearchViewModel {
    struct Input {
        let searchTerm: Observable<String>
        let searchBtnTapped: Observable<Void>
    }
    
    struct Output {
        let fetchedRestaurant = BehaviorRelay<[Restaurant]>(value: [])
    }
}
