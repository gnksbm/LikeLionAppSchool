//
//  String+.swift
//  
//
//  Created by gnksbm on 2023/12/22.
//

import Foundation

extension String {
    public static var naverID: Self {
        guard let naverID = Bundle.main.object(forInfoDictionaryKey: "NAVER_CLIENT_ID") as? String
        else { return "" }
        return naverID
    }
    
    public static var naverSecret: Self {
        guard let naverSecret = Bundle.main.object(forInfoDictionaryKey: "NAVER_CLIENT_SECRET") as? String
        else { return "" }
        return naverSecret
    }
}
