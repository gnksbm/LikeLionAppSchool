//
//  StationArrivalInfoRepository.swift
//  XMLParsingUI
//
//  Created by gnksbm on 1/26/24.
//

import SwiftUI

struct Item {
    let busRouteAbrv: String
    let arrmsg1: String
    let arrmsg2: String
    
    init?(dic: [String: String]?) {
        guard let busRouteAbrv = dic?["busRouteAbrv"],
              let arrmsg1 = dic?["arrmsg1"],
              let arrmsg2 = dic?["arrmsg2"]
        else { return nil }
        self.busRouteAbrv = busRouteAbrv
        self.arrmsg1 = arrmsg1
        self.arrmsg2 = arrmsg2
    }
}

final class StationArrivalInfoRepository: NSObject, ObservableObject {
    @Published var items: [Item] = []
    private var key: String?
    private var dic: [String: String]?
    
    func fetchData() {
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
        else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data else { return }
            let xmlParser = XMLParser(data: data)
            xmlParser.delegate = self
            xmlParser.parse()
        }.resume()
    }
}

extension StationArrivalInfoRepository: XMLParserDelegate {
    func parser(
        _ parser: XMLParser,
        didStartElement elementName: String,
        namespaceURI: String?,
        qualifiedName qName: String?,
        attributes attributeDict: [String : String] = [:]
    ) {
        switch elementName {
        case "itemList":
            dic = [:]
        case "busRouteAbrv":
            key = "busRouteAbrv"
        case "arrmsg1":
            key = "arrmsg1"
        case "arrmsg2":
            key = "arrmsg2"
        default:
            break
        }
    }
    
    func parser(
        _ parser: XMLParser,
        foundCharacters string: String
    ) {
        guard dic != nil,
              let key
        else { return }
        self.dic?.updateValue(string, forKey: key)
    }
    
    func parser(
        _ parser: XMLParser, 
        didEndElement elementName: String,
        namespaceURI: String?,
        qualifiedName qName: String?
    ) {
        switch elementName {
        case "itemList":
            guard let item = Item(dic: dic)
            else { return }
            items.append(item)
            dic = nil
        case "busRouteAbrv":
            key = nil
        case "arrmsg1":
            key = nil
        case "arrmsg2":
            key = nil
        default:
            break
        }
    }
}

#Preview {
    ContentView()
}
