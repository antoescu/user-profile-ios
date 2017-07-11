//
//  Skill.swift
//  UserProfile
//
//  Created by Antonio Escudero on 6/3/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import Foundation

struct Skill {
    
    let name: String
    let rating: Int
}

typealias SkillJSON = [String: Any]

extension Skill {
    
    init?(json: [String: Any]) {
        
        guard let name = json["name"] as? String,
            let rating = json["rating"] as? Int else {
                
                return nil
        }
        
        self.name = name
        self.rating = rating
    }
}
