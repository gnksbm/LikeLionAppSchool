//
//  NaverMapUseCase.swift
//  NaverMapKit
//
//  Created by gnksbm on 3/25/24.
//

import Foundation

import RxSwift

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
    
    func getNearbyStop() -> Observable<(BusStopInfoResponse, String)> {
        locationService.requestAuthorize()
        return locationService.locationResponse
            .withUnretained(self)
            .map { useCase, status in
                var response: BusStopInfoResponse
                var distanceStr: String
                let requestMessage = "주변 정류장을 확인하려면 위치 정보를 동의해주세요."
                let errorMessage = "오류가 발생했습니다. 관리자에게 문의해주세요."
                switch status {
                case .authorized(let location):
                    print(#function, location)
                    (response, distanceStr) = useCase.busStopInfoRepository
                        .getNearByStopInfo(startPointLocation: location)
                case .notAuthorized:
                    response = .init(
                        busStopName: requestMessage,
                        busStopId: "",
                        direction: "",
                        longitude: 126.979620,
                        latitude: 37.570028
                    )
                    distanceStr = ""
                case .error:
                    response = .init(
                        busStopName: errorMessage,
                        busStopId: "",
                        direction: "",
                        longitude: 126.979620,
                        latitude: 37.570028
                    )
                    distanceStr = ""
                }
                return (response, distanceStr)
            }
    }
}
