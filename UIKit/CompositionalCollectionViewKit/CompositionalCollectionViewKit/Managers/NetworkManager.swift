//
//  NetworkManager.swift
//  CompositionalCollectionViewKit
//
//  Created by gnksbm on 2023/08/08.
//

import Foundation

class NetworkManager {
    enum MyError: Error {
        case urlError, urlSessionError, jsonError
    }
    
    static let shared = NetworkManager()
    
    func request(urlString: String) async -> Result<DaeguFood, MyError> {
        let urlString: String = "https://www.daegufood.go.kr/kor/api/tasty.html?mode=json&addr=%EC%A4%91%EA%B5%AC"
        
        // api로 호출한 데이터의 구조체
        var welcome: DaeguFood
        
        guard let url = URL(string: urlString) else {
            print("Wrong URL")
            return .failure(.urlError)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            do {
                welcome = try JSONDecoder().decode(DaeguFood.self, from: data)
                return .success(welcome)
            } catch {
                print(data)
                return .failure(.jsonError)
            }
        } catch {
            return .failure(.urlSessionError)
        }
    }
    
    private init() { }
}
