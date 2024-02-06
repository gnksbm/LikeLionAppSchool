//
//  FirstPartyRepository.swift
//  XMLParsingUI
//
//  Created by gnksbm on 1/26/24.
//

import SwiftUI

final class FirstPartyRepository
: NSObject, ObservableObject, XMLParsingRepository {
    @Published var items: [Item] = []
    private var key: String?
    private var xmlDic: [String: String]?
    
    func fetchData() {
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            let xmlParser = XMLParser(data: data)
            xmlParser.delegate = self
            xmlParser.parse()
        }.resume()
    }
}

extension FirstPartyRepository: XMLParserDelegate {
    // <itemList>
    func parser(
        _ parser: XMLParser,
        didStartElement elementName: String,
        namespaceURI: String?,
        qualifiedName qName: String?,
        attributes attributeDict: [String : String] = [:]
    ) {
        switch elementName {
        case "itemList":
            xmlDic = [:]
        case "busRouteAbrv", "busRouteId", "routeType", "arrmsg1", "arrmsg2":
            key = elementName
        default:
            break
        }
    }
    // <??>XXXX</??>
    func parser(
        _ parser: XMLParser,
        foundCharacters string: String
    ) {
        guard xmlDic != nil,
              let key
        else { return }
        // arrmsg의 분표시가 (시간, 분 xx초[x정거장 전])으로 2번에 나누어 들어와 예외처리
        if key == "arrmsg1",
           let value = xmlDic?["arrmsg1"] {
            xmlDic?.updateValue(value + string, forKey: key)
            return
        }
        if key == "arrmsg2",
           let value = xmlDic?["arrmsg2"] {
            xmlDic?.updateValue(value + string, forKey: key)
            return
        }
        self.xmlDic?.updateValue(string, forKey: key)
    }
    
    func parser(
        _ parser: XMLParser, 
        didEndElement elementName: String,
        namespaceURI: String?,
        qualifiedName qName: String?
    ) {
        switch elementName {
        case "itemList":
            guard let item = Item(dic: xmlDic)
            else { return }
            items.append(item)
            xmlDic = nil
        case "busRouteAbrv", "busRouteId", "routeType", "arrmsg1", "arrmsg2":
            key = nil
        default:
            break
        }
    }
}

#Preview {
    ContentView()
}
