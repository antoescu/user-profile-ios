//
//  UserToViewModelMapper.swift
//  UserProfile
//
//  Created by Antonio Escudero on 6/3/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import Foundation

struct UserToViewModelMapper: Mappable {
    
    func map(_ user: User) -> UserViewModel {
        
        let viewModel = UserViewModel(
            firstName: user.firstName,
            lastName: user.lastName,
            career: user.career,
            pictureUrl: URL(string: user.picture)
        )
        
        return viewModel
    }
}
