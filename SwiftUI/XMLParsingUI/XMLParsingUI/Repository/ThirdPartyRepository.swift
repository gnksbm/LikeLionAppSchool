//
//  ThirdPartyRepository.swift
//  XMLParsingUI
//
//  Created by gnksbm on 1/30/24.
//

import SwiftUI

import SwiftyXMLParser

final class ThirdPartyRepository
: NSObject, ObservableObject, XMLParsingRepository {
    @Published var items: [Item] = []
    
    func fetchData() {
        URLSession.shared.dataTask(
            with: request
        ) { [weak self] data, response, error in
            guard let data else { return }
            let xml = XML.parse(data)
//            self?.items = xml.ServiceResult.msgBody.itemList
            self?.items = xml.ServiceResult.msgBody.itemList
                .compactMap {
                    return Item(
                        busRouteAbrv: $0.busRouteAbrv.text,
                        busRouteId: $0.busRouteId.text,
                        routeType: $0.routeType.text,
                        arrmsg1: $0.arrmsg1.text,
                        arrmsg2: $0.arrmsg2.text
                    )
                }
        }.resume()
    }
}

#Preview {
    ContentView()
}
