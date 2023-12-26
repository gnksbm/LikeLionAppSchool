//
//  LocationDetailViewModel.swift
//  
//
//  Created by gnksbm on 2023/12/25.
//

import Foundation

import Domain

import RxRelay

final class LocationDetailViewModel: ViewModel {
    private let entity: SearchLocationEntity
    
    init(entity: SearchLocationEntity) {
        self.entity = entity
    }
    
    func transform(input: Input) -> Output {
        let output = Output()
        var textViewValue = "{\n"
        textViewValue.append(
            Mirror(reflecting: entity).children
                .map {
                    "     \($0.label!) = \($0.value)"
                }
                .joined(separator: ",\n")
        )
        textViewValue.append("\n}")
        output.textViewValue.accept(textViewValue)
        return output
    }
}

extension LocationDetailViewModel {
    struct Input {
        
    }
    
    struct Output {
        let textViewValue = BehaviorRelay<String>(value: "")
    }
}
