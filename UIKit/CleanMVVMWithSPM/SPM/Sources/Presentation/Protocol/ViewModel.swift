//
//  ViewModel.swift
//  
//
//  Created by gnksbm on 2023/12/22.
//

import Foundation

protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
