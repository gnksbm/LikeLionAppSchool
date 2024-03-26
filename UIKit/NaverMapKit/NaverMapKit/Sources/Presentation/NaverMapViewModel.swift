//
//  NaverMapViewModel.swift
//  NaverMapKit
//
//  Created by gnksbm on 3/25/24.
//

import Foundation

import RxSwift

final class NaverMapViewModel: ViewModel {
    private let useCase: NaverMapUseCase
    
    private let disposeBag = DisposeBag()
    
    init(useCase: NaverMapUseCase) {
        self.useCase = useCase
    }
    
    func transform(input: Input) -> Output {
        let output = Output(
            selectedBusStopInfo: .init(),
            nearStopList: .init()
        )
        
        input.informationViewTapEvent
            .subscribe(
                onNext: { _ in
                    guard let url = URL(
                        string: UIApplication.openNotificationSettingsURLString
                    )
                    else { return }
                    UIApplication.shared.open(url)
                }
            )
            .disposed(by: disposeBag)
        
        useCase.getNearbyStop()
            .bind(to: output.selectedBusStopInfo)
            .disposed(by: disposeBag)
        
        return output
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

protocol ViewModel {
    associatedtype Input
    associatedtype Output
    func transform(input: Input) -> Output
}
