//
//  Item.swift
//  XMLParsingUI
//
//  Created by gnksbm on 1/30/24.
//

import Foundation

struct Item {
    let busRouteAbrv: String
    let busRouteId: String
    let routeType: String
    let arrmsg1: String
    let arrmsg2: String
    
    init?(
        busRouteAbrv: String?,
        busRouteId: String?,
        routeType: String?,
        arrmsg1: String?,
        arrmsg2: String?
    ) {
        guard let busRouteAbrv,
              let busRouteId,
              let routeType,
              let arrmsg1,
              let arrmsg2
        else { return nil }
        self.busRouteAbrv = busRouteAbrv
        self.busRouteId = busRouteId
        self.routeType = routeType
        self.arrmsg1 = arrmsg1
        self.arrmsg2 = arrmsg2
    }
    
    init?(dic: [String: String]?) {
        guard let busRouteAbrv = dic?["busRouteAbrv"],
              let busRouteId = dic?["busRouteId"],
              let routeType = dic?["routeType"],
              let arrmsg1 = dic?["arrmsg1"],
              let arrmsg2 = dic?["arrmsg2"]
        else { return nil }
        self.busRouteAbrv = busRouteAbrv
        self.busRouteId = busRouteId
        self.routeType = routeType
        self.arrmsg1 = arrmsg1
        self.arrmsg2 = arrmsg2
    }
}
