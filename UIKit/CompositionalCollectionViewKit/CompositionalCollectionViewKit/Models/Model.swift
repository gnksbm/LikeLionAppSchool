//
//  Model.swift
//  CompositionalCollectionViewKit
//
//  Created by gnksbm on 2023/08/10.
//

import Foundation

struct RestaurantData: Identifiable {
    let id = UUID()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class RestaurantModel {
    let networkManager = NetworkManager.shared
    
    var datas: [RestaurantData] = []
    
    func fetchData(completion: @escaping () -> ()) {
        Task {
            let daeguFood = await networkManager.request(urlString: "https://www.daegufood.go.kr/kor/api/tasty.html?mode=json&addr=%EC%A4%91%EA%B5%AC")
            switch daeguFood {
            case .success(let daegu):
                DispatchQueue.main.async {
                    self.datas = daegu.restaurants.map { RestaurantData(name: $0.bzNm) }
                    completion()
                }
                print(datas)
            case .failure(let error):
                print("\(error)".uppercased())
            }
        }
    }
}
