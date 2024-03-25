//
//  BusStopInfoRepository.swift
//  NaverMapKit
//
//  Created by gnksbm on 3/25/24.
//

import Foundation

final class BusStopInfoRepository {
    private var responses: [BusStopInfoResponse] = []
    
    init() {
        fetchList()
    }
    
    private func fetchList() {
        guard let url = Bundle.main.url(
            forResource: "total_stationList",
            withExtension: "json"
        )
        else { return }
        do {
            let data = try Data(contentsOf: url)
            responses = try JSONDecoder()
                .decode(
                    BusStopListDTO.self,
                    from: data
                )
                .toDomain
        } catch {
            print(error.localizedDescription)
        }
    }
}
