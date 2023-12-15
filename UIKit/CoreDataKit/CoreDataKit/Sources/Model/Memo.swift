//
//  Memo.swift
//  CoreDataKit
//
//  Created by gnksbm on 2023/12/14.
//  Copyright © 2023 gnksbm. All rights reserved.
//

import Foundation

struct Memo: Hashable {
    var content: String
    let date: Date
    
    init(content: String, date: Date) {
        self.content = content
        self.date = date
    }
    
    init(content: String) {
        self.init(content: content, date: .now)
    }
    
    init?(content: String?, date: Date?) {
        guard let content,
              let date
        else { return nil }
        self.content = content
        self.date = date
    }
}
