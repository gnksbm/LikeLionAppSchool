//
//  MemoEntity+CoreDataProperties.swift
//  
//
//  Created by gnksbm on 2023/12/14.
//
//

import Foundation
import CoreData


extension MemoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MemoEntity> {
        return NSFetchRequest<MemoEntity>(entityName: "MemoEntity")
    }

    @NSManaged public var content: String?
    @NSManaged public var date: Date?

    var toModel: Memo? {
        .init(content: content, date: date)
    }
}
