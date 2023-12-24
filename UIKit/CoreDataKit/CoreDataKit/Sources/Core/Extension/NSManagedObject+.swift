//
//  NSManagedObject+.swift
//  CoreDataKit
//
//  Created by gnksbm on 2023/12/20.
//  Copyright © 2023 gnksbm. All rights reserved.
//

import CoreData

extension NSManagedObject {
    convenience init<T>(
        entity: NSEntityDescription,
        insertInto: NSManagedObjectContext,
        data: T
    ) {
        self.init(entity: entity, insertInto: insertInto)
        let mirror = Mirror(reflecting: data)
        mirror.children.forEach { key, value in
            guard let key,
            let propertyName = String(describing: key).split(separator: ".").last
            else { return }
            setValue(value, forKey: String(propertyName))
        }
    }
}
