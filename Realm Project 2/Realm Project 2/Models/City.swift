//
//  City.swift
//  Realm Project 2
//
//  Created by Steve Pha on 1/25/23.
//

import Foundation
import RealmSwift

class City: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted(originProperty: "cities") var country: LinkingObjects<Country>
    
    convenience init(name: String){
        self.init()
        self.name = name
    }
}
