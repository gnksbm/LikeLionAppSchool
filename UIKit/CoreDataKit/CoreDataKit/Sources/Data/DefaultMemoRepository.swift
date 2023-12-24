//
//  DefaultMemoRepository.swift
//  CoreDataKit
//
//  Created by gnksbm on 2023/12/20.
//  Copyright © 2023 gnksbm. All rights reserved.
//

import Foundation
import CoreData

final class DefaultMemoRepository: MemoRepository {
    
    private let storage: CoreDataStorage
    
    init(storage: CoreDataStorage) {
        self.storage = storage
    }
    
    func fetch() -> [Memo] {
        storage.fetch(type: MemoEntity.self)
            .compactMap { $0 as? MemoEntity }
            .compactMap { $0.toModel }
    }
    
    func save(memo: Memo) {
        storage.save(data: memo)
    }
    
    func delete(memo: Memo) {
        storage.delete(data: memo)
    }
}
