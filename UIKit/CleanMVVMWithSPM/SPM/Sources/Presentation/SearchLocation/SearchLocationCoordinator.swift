//
//  SearchLocationCoordinator.swift
//  
//
//  Created by gnksbm on 2023/12/25.
//

import Foundation

import Domain

public protocol SearchLocationCoordinator: Coordinator {
    func pushDetail(entity: SearchLocationEntity)
}
