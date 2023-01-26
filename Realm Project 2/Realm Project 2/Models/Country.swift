//
//  Country.swift
//  Realm Project 2
//
//  Created by Steve Pha on 1/25/23.
//

import Foundation
import RealmSwift

class Country: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var cities: List<City>
    @Persisted var flag = "🏳"
    
    convenience init(name: String){
        self.init()
        self.name = name
    }
}
