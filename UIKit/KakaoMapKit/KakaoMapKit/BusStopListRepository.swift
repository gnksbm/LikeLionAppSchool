//
//  BusStopListRepository.swift
//  KakaoMapKit
//
//  Created by gnksbm on 2/4/24.
//

import Foundation

import RxSwift

public final class BusStopListRepository {
    public let busStopInfoResponse = BehaviorSubject<[BusStopInfoResponse]>(
        value: []
    )
    
    public init() {
        fetchLocalBusStopList()
    }
    
    private func fetchLocalBusStopList() {
        guard let url = Bundle.main.url(
            forResource: "stationList",
            withExtension: "json"
        )
        else { return }
        do {
            let data = try Data(contentsOf: url)
            let stationList = try JSONDecoder().decode(
                BusStopListDTO.self, from: data
            )
            busStopInfoResponse.onNext(stationList.toDomain)
        } catch {
            busStopInfoResponse.onError(error)
        }
    }
}
