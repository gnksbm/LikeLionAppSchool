//
//  SearchLocationRepository.swift
//  
//
//  Created by gnksbm on 2023/12/23.
//

import Foundation

import RxSwift

public protocol SearchLocationRepository {
    func fetchLocation(
        query: String,
        display: Int?,
        start: Int?,
        sort: String?
    ) -> Observable<[Restaurant]>
}
