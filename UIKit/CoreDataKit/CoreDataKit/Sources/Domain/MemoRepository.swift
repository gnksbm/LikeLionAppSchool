//
//  MemoRepository.swift
//  CoreDataKit
//
//  Created by gnksbm on 2023/12/18.
//  Copyright © 2023 gnksbm. All rights reserved.
//

import Foundation

protocol MemoRepository {
    func save(memo: Memo)
    func fetch() -> [Memo]
    func delete(memo: Memo)
}
