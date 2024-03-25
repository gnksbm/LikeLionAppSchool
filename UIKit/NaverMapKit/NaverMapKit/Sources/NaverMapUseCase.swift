//
//  NaverMapUseCase.swift
//  NaverMapKit
//
//  Created by gnksbm on 3/25/24.
//

import Foundation

final class NaverMapUseCase {
    private let busStopInfoRepository: BusStopInfoRepository
    private let locationService: LocationService
    
    init(
        busStopInfoRepository: BusStopInfoRepository,
        locationService: LocationService
    ) {
        self.busStopInfoRepository = busStopInfoRepository
        self.locationService = locationService
    }
}
