//
//  XMLParsingRepository.swift
//  XMLParsingUI
//
//  Created by gnksbm on 1/30/24.
//

import Foundation

protocol XMLParsingRepository { }

extension XMLParsingRepository {
    var request: URLRequest {
        guard let any = Bundle.main.object(forInfoDictionaryKey: "SERVER_KEY"),
              let serverKey = any as? String
        else { fatalError("Can't Not Find Server Key") }
        var components = URLComponents()
        components.scheme = "http"
        components.host = "ws.bus.go.kr"
        components.path = "/api/rest/arrive/getLowArrInfoByStId"
        components.queryItems = [
            .init(name: "ServiceKey", value: serverKey.removingPercentEncoding),
            .init(name: "stId", value: "121000214"),
        ]
        guard let url = components.url
        else { fatalError("Invalid URL") }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        return urlRequest
    }
}
