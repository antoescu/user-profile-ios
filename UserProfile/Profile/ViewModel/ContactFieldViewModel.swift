//
//  ContactFieldViewModel.swift
//  UserProfile
//
//  Created by Antonio Escudero on 6/30/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import Foundation

struct ContactFieldViewModel {
    
    enum `Type` {
        
        case email
        case phone
        case web
        case github
    }
    
    let type: Type
    let value: String
}
