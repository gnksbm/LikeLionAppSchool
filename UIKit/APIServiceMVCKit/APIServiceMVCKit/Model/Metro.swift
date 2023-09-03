//
//  Metro.swift
//  APIServiceMVCKit
//
//  Created by gnksbm on 2023/09/03.
//

import Foundation

// MARK: - Welcome
struct Metro: Codable {
    let errorMessage: ErrorMessage
    let realtimePositionList: [RealtimePositionList]
}

// MARK: - ErrorMessage
struct ErrorMessage: Codable {
    let status: Int
    let code, message, link, developerMessage: String
    let total: Int
}

// MARK: - RealtimePositionList
struct RealtimePositionList: Codable {
    let beginRow, endRow, curPage, pageRow: JSONNull?
    let totalCount, rowNum, selectedCount: Int
    let subwayID, subwayNm, statnID, statnNm: String
    let trainNo, lastRecptnDt, recptnDt, updnLine: String
    let statnTid, statnTnm, trainSttus, directAt: String
    let lstcarAt: String

    enum CodingKeys: String, CodingKey {
        case beginRow, endRow, curPage, pageRow, totalCount, rowNum, selectedCount
        case subwayID = "subwayId"
        case subwayNm
        case statnID = "statnId"
        case statnNm, trainNo, lastRecptnDt, recptnDt, updnLine, statnTid, statnTnm, trainSttus, directAt, lstcarAt
    }
}

extension RealtimePositionList: Identifiable {
    var id: UUID {
        UUID()
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
