//
//  Music.swift
//  MusicAPIUI
//
//  Created by gnksbm on 2023/08/14.
//

import Foundation

// MARK: - Welcome
struct Music: Codable {
    let resultCount: Int
    let results: [ResultList]
}

// MARK: - Result
struct ResultList: Codable {
//    let wrapperType: WrapperType
//    let kind: Kind
    let artistID: Int
    let collectionID: Int?
    let trackID: Int
    let artistName: String
//    let collectionName: String?
//    let trackName: String
//    let collectionCensoredName: String?
//    let trackCensoredName: String
//    let artistViewURL: String
//    let collectionViewURL: String?
//    let trackViewURL: String
//    let previewURL: String?
//    let artworkUrl30: String
//    let artworkUrl60: String
    let artworkUrl100: String
//    let collectionPrice, trackPrice: Double?
//    let releaseDate: Date?
////    let collectionExplicitness, trackExplicitness: Explicitness
//    let discCount, discNumber, trackCount, trackNumber: Int?
//    let trackTimeMillis: Int
////    let country: Country
////    let currency: Currency
//    let primaryGenreName: String
//    let isStreamable: Bool?
////    let contentAdvisoryRating: ContentAdvisoryRating?
//    let collectionArtistID: Int?
//    let collectionArtistName: String?
//    let collectionArtistViewURL: String?

    enum CodingKeys: String, CodingKey {
//        case wrapperType, kind
        case artistID = "artistId"
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName
        case artworkUrl100
//        case collectionName, trackName, collectionCensoredName, trackCensoredName
//        case artistViewURL = "artistViewUrl"
//        case collectionViewURL = "collectionViewUrl"
//        case trackViewURL = "trackViewUrl"
//        case previewURL = "previewUrl"
//        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, primaryGenreName, isStreamable
////        case collectionExplicitness, trackExplicitness
////        case country
////        case contentAdvisoryRating
////        case currency
//        case collectionArtistID = "collectionArtistId"
//        case collectionArtistName
//        case collectionArtistViewURL = "collectionArtistViewUrl"
    }
}

//enum Explicitness: String, Codable {
//    case explicit = "explicit"
//    case notExplicit = "notExplicit"
//}
//
//enum ContentAdvisoryRating: String, Codable {
//    case explicit = "Explicit"
//}
//
//enum Country: String, Codable {
//    case usa = "USA"
//}
//
//enum Currency: String, Codable {
//    case usd = "USD"
//}
//
//enum Kind: String, Codable {
//    case musicVideo = "music-video"
//    case song = "song"
//}
//
//enum WrapperType: String, Codable {
//    case track = "track"
//}
