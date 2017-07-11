//
//  SkillViewModel.swift
//  UserProfile
//
//  Created by Antonio Escudero on 6/3/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import UIKit

struct SkillViewModel {
    
    enum Expertise {
        
        case high
        case medium
        case low
    }
    
    let name: String
    let expertise: Expertise
}
