//
//  SearchLocationUseCase.swift
//  
//
//  Created by gnksbm on 2023/12/22.
//

import Foundation

import RxSwift

public protocol SearchLocationUseCase {
    func searchLocation(query: String, display: Int?, start: Int?, sort: String?) -> Observable<[Restaurant]>
}
