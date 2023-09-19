//
//  Person.swift
//  RealmUI
//
//  Created by gnksbm on 2023/09/19.
//

import Foundation
import RealmSwift

class Person: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String = ""
    @Persisted var age: Int = 0
}
