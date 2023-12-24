//
//  DefaultMemoUseCase.swift
//  CoreDataKit
//
//  Created by gnksbm on 2023/12/18.
//  Copyright © 2023 gnksbm. All rights reserved.
//

import Foundation

final class DefaultMemoUseCase: MemoUseCase {
    private let repository: MemoRepository
    
    init(repository: MemoRepository) {
        self.repository = repository
    }
    
    func save(memo: Memo) {
        
    }
    
    func fetch() -> [Memo] {
        return []
    }
    
    func delete(memo: Memo) {
        
    }
}
