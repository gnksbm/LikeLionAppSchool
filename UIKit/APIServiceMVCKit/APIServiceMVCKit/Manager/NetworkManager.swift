//
//  NetworkManager.swift
//  APIServiceMVCKit
//
//  Created by gnksbm on 2023/09/03.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    let urlString = "http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimePosition/0/5/"
//    "http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimePosition/0/5/1호선"
    
    func fetchData(searchTerm: String, completion: @escaping (Metro) -> ()) {
        let finalString: String = urlString + searchTerm
        guard let encodedString = finalString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: encodedString) else { return }
        var metro: Metro?
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else { return }
            do {
                metro = try JSONDecoder().decode(Metro.self, from: data)
                guard let metro else { return }
                completion(metro)
            } catch {
                
            }
        }.resume()
        return
    }
    
    private init () { }
}
