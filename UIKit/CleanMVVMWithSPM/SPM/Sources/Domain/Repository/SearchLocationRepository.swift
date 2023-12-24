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
        request: SearchLocationRequest
    ) -> Observable<[SearchLocationEntity]>
}
