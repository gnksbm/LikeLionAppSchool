//
//  CoreDataStorage.swift
//  CoreDataKit
//
//  Created by gnksbm on 2023/12/20.
//  Copyright © 2023 gnksbm. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataStorage {
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
    
    func fetch(type: NSManagedObject.Type) -> [NSFetchRequestResult] {
        do {
            return try container.viewContext.fetch(type.fetchRequest())
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func save<T>(data: T) {
        guard let entity else { return }
        let object = NSManagedObject(
            entity: entity,
            insertInto: container.viewContext,
            data: data
        )
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func delete<T>(data: T) {
        guard let entity else { return }
        let object = NSManagedObject(
            entity: entity,
            insertInto: container.viewContext,
            data: data
        )
        container.viewContext.delete(object)
        do {
            try container.viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
