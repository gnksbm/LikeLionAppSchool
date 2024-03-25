//
//  NaverMapViewModel.swift
//  NaverMapKit
//
//  Created by gnksbm on 3/25/24.
//

import Foundation

import RxSwift

public protocol ViewModel {
    associatedtype Input
    associatedtype Output
    func transform(input: Input) -> Output
}

final class NaverMapViewModel: ViewModel {
    private let useCase: NaverMapUseCase
    
    init(useCase: NaverMapUseCase) {
        self.useCase = useCase
    }
    
    func transform(input: Input) -> Output {
        let output = Output(
            selectedBusStopInfo: .init(),
            nearStopList: .init()
        )
        return output
    }
    
    private func getNearbyStop() {
        
    }
}

extension NaverMapViewModel {
    public struct Input {
        let viewWillAppearEvent: Observable<Void>
        let informationViewTapEvent: Observable<Void>
        let selectedBusStopId: Observable<String>
        let locationChangeEvent
        : Observable<(ClosedRange<Double>, ClosedRange<Double>)>
    }
    
    public struct Output {
        let selectedBusStopInfo: PublishSubject<(BusStopInfoResponse, String)>
        let nearStopList: PublishSubject<[BusStopInfoResponse]>
    }
}
