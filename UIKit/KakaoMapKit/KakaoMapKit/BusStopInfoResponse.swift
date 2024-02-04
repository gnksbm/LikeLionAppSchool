//
//  BusStopInfoResponse.swift
//  KakaoMapKit
//
//  Created by gnksbm on 2/4/24.
//

import Foundation

public struct BusStopInfoResponse {
    public let name: String
    public let busStopId: String
    public let longitude: String
    public let latitude: String
    
    public init(
        name: String,
        busStopId: String,
        longitude: String,
        latitude: String
    ) {
        self.name = name
        self.busStopId = busStopId
        self.longitude = longitude
        self.latitude = latitude
    }
}
