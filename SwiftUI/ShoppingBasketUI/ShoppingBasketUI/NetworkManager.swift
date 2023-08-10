//
//  NetworkManager.swift
//  ShoppingBasketUI
//
//  Created by gnksbm on 2023/08/04.
//

import Foundation

class NetworkManager: ObservableObject {
    func request(query: String) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/shop.json") else { return }
        
        var requestURL = URLRequest(url: url)
        requestURL.addValue(String.naverID, forHTTPHeaderField: "X-Naver-Client-Id")
        requestURL.addValue(String.naverKey, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        let tast = URLSession.shared.dataTask(with: requestURL) { data, response, error in
            guard let data else { return }
            print(data)
        }
    }
}
            
