//
//  ContactFieldsModelMapper.swift
//  UserProfile
//
//  Created by Antonio Escudero on 7/1/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import Foundation

struct ContactFieldsModelMapper: Mappable {
    
    func map(_ user: User) -> [ContactFieldViewModel] {
        
        let viewModels = [
            
            ContactFieldViewModel(type: .email, value: user.email),
            ContactFieldViewModel(type: .phone, value: String(user.phone).asPhoneFormat),
            ContactFieldViewModel(type: .web, value: user.web),
            ContactFieldViewModel(type: .github, value: user.github)
        ]
        
        return viewModels
    }
}
