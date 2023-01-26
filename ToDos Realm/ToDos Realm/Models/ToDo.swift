//
//  ToDo.swift
//  ToDos Realm
//
//  Created by Steve Pha on 1/24/23.
//

import Foundation
import RealmSwift
import SwiftUI

class ToDo: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var completed = false
    @Persisted var urgency: Urgency = .neutral
    
    enum Urgency: Int, PersistableEnum {
        case trivial, neutral, urgent
         
        var text: String {
            switch self {
            case .trivial:
                return "Trivial"
            case .neutral:
                return "Neutral"
            case .urgent:
                return "Ugent"
            }
        }
        
        var color: Color {
            switch self {
            case .trivial:
                return .teal
            case .neutral:
                return .secondary
            case .urgent:
                return .red
            }
        }
    }
    
    
    func increment() -> Urgency {
        switch urgency {
        case .trivial:
            return .neutral
        case .neutral:
            return . urgent
        case .urgent:
            return .trivial
        }
    }
    
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
