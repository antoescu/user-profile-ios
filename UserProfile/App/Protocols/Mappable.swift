//
//  Mappable.swift
//  UserProfile
//
//  Created by Antonio Escudero on 6/3/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import Foundation

protocol Mappable {
    
    associatedtype EntryClass
    associatedtype ExitClass
    
    func map(_ object: EntryClass) -> ExitClass
}

extension Mappable {
    
    func map(_ objects: [EntryClass]) -> [ExitClass] {
        
        return objects.map { object -> ExitClass in
            
            return map(object)
        }
    }
}
