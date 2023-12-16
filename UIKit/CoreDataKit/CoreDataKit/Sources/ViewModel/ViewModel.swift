//
//  ViewModel.swift
//  CoreDataKit
//
//  Created by gnksbm on 2023/12/16.
//  Copyright © 2023 gnksbm. All rights reserved.
//

import Foundation

protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
