//
//  SearchlocationViewModel.swift
//  
//
//  Created by gnksbm on 2023/12/22.
//

import Foundation

import Domain

import RxSwift
import RxRelay

public final class SearchlocationViewModel: ViewModel {
    private let useCase: SearchLocationUseCase
    private let disposeBag = DisposeBag()
    
    private let request = BehaviorRelay<SearchLocationRequest>(value: .init())
    private let displayValue = BehaviorRelay<String?>(value: nil)
    private let startValue = BehaviorRelay<String?>(value: nil)
    
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
        
        input.pickerChanged
            .withUnretained(self)
            .subscribe { viewModel, pick in
                switch pick.component {
                case 0:
                    viewModel.displayValue.accept(pick.row == 0 ? nil : String(pick.row))
                case 1:
                    viewModel.startValue.accept(pick.row == 0 ? nil : String(pick.row))
                default:
                    break
                }
        }.disposed(by: disposeBag)
        
        Observable.combineLatest(
            input.searchTerm,
            displayValue.asObservable(),
            startValue.asObservable()
        )
        .withUnretained(self)
        .subscribe { viewModel, value in
            viewModel.request.accept(
                SearchLocationRequest(
                    query: value.0,
                    display: value.1,
                    start: value.2
                )
            )
        }.disposed(by: disposeBag)
        
        input.searchBtnTapped
            .withUnretained(self)
            .subscribe(onNext: { viewModel, _ in
                viewModel.useCase.searchLocation(
                    request: viewModel.request.value
                )
            }).disposed(by: disposeBag)
        
        return output
    }
}

extension SearchlocationViewModel {
    struct Input {
        let searchTerm: Observable<String>
        let pickerChanged: Observable<(row: Int, component: Int)>
        let searchBtnTapped: Observable<Void>
        let resultTapped: Observable<IndexPath>
    }
    
    struct Output {
        let fetchedRestaurant = BehaviorRelay<[SearchLocationEntity]>(value: [])
    }
}
