//
//  RealmManager.swift
//  RealmUI
//
//  Created by gnksbm on 2023/09/19.
//

import Foundation
import RealmSwift

final class RealmManager: ObservableObject {
    @Published var person: Person = .init()
    let realm = try! Realm()
    
    func create() {
        try! realm.write {
            realm.add(person)
        }
    }
    
    func read() -> Person {
        let realm = try! Realm()
        let filteredData = realm.objects(Person.self)
            .filter("age > 50")
        let arrData = Array(filteredData)
        guard let resultData = arrData.first else { return Person() }
        
        return resultData
    }
    
    func delete() {
      let realm = try! Realm()
      try! realm.write {
        realm.delete(realm.objects(Person.self))
      }
    }
}
