//
//  SearchLocationUseCase.swift
//  
//
//  Created by gnksbm on 2023/12/22.
//

import Foundation

import RxSwift

public protocol SearchLocationUseCase {
    var successedFetch: PublishSubject<[SearchLocationEntity]> { get set }
    
    func searchLocation(request: SearchLocationRequest)
}
