//
//  CoreDataService.swift
//  CoreDataKit
//
//  Created by gnksbm on 2023/12/14.
//  Copyright © 2023 gnksbm. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataService {
    private let entity: NSEntityDescription?
    private let container: NSPersistentContainer
    
    init(containerName: String, entityName: String) {
        container = NSPersistentContainer(name: containerName)
        entity = NSEntityDescription.entity(
            forEntityName: entityName,
            in: container.viewContext
        )
        container.loadPersistentStores { _, error in
            if let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchContext() -> [NSFetchRequestResult] {
        do {
            return try container.viewContext.fetch(MemoEntity.fetchRequest())
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func saveContext(memo: Memo) {
        guard let entity else { return }
        let object = NSManagedObject(entity: entity, insertInto: container.viewContext)
        let mirror = Mirror(reflecting: memo)
        mirror.children.forEach { key, value in
            guard let key,
            let propertyName = String(describing: key).split(separator: ".").last
            else { return }
            object.setValue(value, forKey: String(propertyName))
        }
        do {
            try container.viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func remove(memo: Memo) {
        guard let entity else { return }
        let object = NSManagedObject(entity: entity, insertInto: container.viewContext)
        let mirror = Mirror(reflecting: memo)
        mirror.children.forEach { key, value in
            guard let key,
            let propertyName = String(describing: key).split(separator: ".").last
            else { return }
            object.setValue(value, forKey: String(propertyName))
        }
        container.viewContext.delete(object)
    }
}
