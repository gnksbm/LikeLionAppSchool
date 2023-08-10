//
//  Extension+Bundle.swift
//  ShoppingBasketUI
//
//  Created by gnksbm on 2023/08/04.
//

import Foundation

extension Bundle {
    var naverID: String {
        guard let file = self.path(forResource: "Secrets", ofType: "plist"),
              let resource = NSDictionary(contentsOfFile: file),
              let key = resource["NAVER_SEARCH_ID"] as? String else { fatalError("NAVER_SEARCH_ID를 가져오는데 실패했습니다.") }
        return key
    }
}
