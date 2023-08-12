//
//  DaeguFood.swift
//  CompositionalCollectionViewKit
//
//  Created by gnksbm on 2023/08/08.
//

import Foundation

struct DaeguFood: Codable {
    let status, total: String
    let restaurants: [Restaurant]
    
    enum CodingKeys: String, CodingKey {
        case status, total
        case restaurants = "data"
    }
}

// MARK: - Datum
struct Restaurant: Codable {
    let cnt, opendataID, gngCS: String
    let fdCS: FdCS
    let bzNm, tlno, mbzHr, seatCnt: String
    let pkpl, hp, psbFrn: String
    let bknYn, infnFcl, brftYn, dssrtYn: BknYn
    let mnu, smplDesc, sbw, bus: String
    
    enum CodingKeys: String, CodingKey {
        case cnt
        case opendataID = "OPENDATA_ID"
        case gngCS = "GNG_CS"
        case fdCS = "FD_CS"
        case bzNm = "BZ_NM"
        case tlno = "TLNO"
        case mbzHr = "MBZ_HR"
        case seatCnt = "SEAT_CNT"
        case pkpl = "PKPL"
        case hp = "HP"
        case psbFrn = "PSB_FRN"
        case bknYn = "BKN_YN"
        case infnFcl = "INFN_FCL"
        case brftYn = "BRFT_YN"
        case dssrtYn = "DSSRT_YN"
        case mnu = "MNU"
        case smplDesc = "SMPL_DESC"
        case sbw = "SBW"
        case bus = "BUS"
    }
}

enum BknYn: String, Codable {
    case empty = ""
    case 가능 = "가능"
    case 당일예약가능 = "당일 예약 가능"
    case 불가 = "불가"
    case 불가능 = "불가능"
    case 예약가능 = "예약가능"
    case 예약가능합니다 = "예약가능합니다."
    case 예약불가전화요망 = "예약 불가(전화요망)"
    case 전화요망 = "전화 요망"
    case 조건부가능 = "조건부 가능"
    case 평일가능 = "평일 가능"
}

enum FdCS: String, Codable {
    case 디저트베이커리 = "디저트/베이커리"
    case 세계요리 = "세계요리"
    case 양식 = "양식"
    case 일식 = "일식"
    case 전통차커피전문점 = "전통차/커피전문점"
    case 중식 = "중식"
    case 특별한술집 = "특별한 술집"
    case 한식 = "한식"
}
