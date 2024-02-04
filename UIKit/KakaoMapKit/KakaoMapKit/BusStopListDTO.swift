//
//  BusStopListDTO.swift
//  KakaoMapKit
//
//  Created by gnksbm on 2/4/24.
//

import Foundation

struct BusStopListDTO: Codable {
    let description: Description
    let data: [BusStopInfo]

    enum CodingKeys: String, CodingKey {
        case description = "DESCRIPTION"
        case data = "DATA"
    }
}

extension BusStopListDTO {
    var toDomain: [BusStopInfoResponse] {
        data.map {
            .init(
                name: $0.stopNm,
                busStopId: $0.stopNo,
                longitude: $0.xcode,
                latitude: $0.ycode
            )
        }
    }
    // MARK: - Datum
    struct BusStopInfo: Codable {
        let stopNm, ycode, stopNo, xcode: String
        // stopType
        // "가로변시간", "가로변전일", "가상정류장", "마을버스", "일반차로", "중앙차로"
        let stopType: String
        let nodeID: String
        
        enum CodingKeys: String, CodingKey {
            case stopNm = "stop_nm"
            case ycode
            case stopNo = "stop_no"
            case xcode
            case stopType = "stop_type"
            case nodeID = "node_id"
        }
    }
    
    // MARK: - Description
    struct Description: Codable {
        let stopType, ycode, stopNm, nodeID: String
        let stopNo, xcode: String
        
        enum CodingKeys: String, CodingKey {
            case stopType = "STOP_TYPE"
            case ycode = "YCODE"
            case stopNm = "STOP_NM"
            case nodeID = "NODE_ID"
            case stopNo = "STOP_NO"
            case xcode = "XCODE"
        }
    }
}
