//
//  MemoUseCase.swift
//  CoreDataKit
//
//  Created by gnksbm on 2023/12/18.
//  Copyright © 2023 gnksbm. All rights reserved.
//

import Foundation

import RxSwift

protocol MemoUseCase {
    func save(memo: Memo)
    func fetch() -> Observable<[Memo]>
    func remove(memo: Memo)
}
