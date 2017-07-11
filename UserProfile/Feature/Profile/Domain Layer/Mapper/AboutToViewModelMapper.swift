//
//  AboutToViewModelMapper.swift
//  UserProfile
//
//  Created by Antonio Escudero on 6/3/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import Foundation

struct AboutToViewModelMapper: Mappable {
    
    func map(_ user: User) -> AboutViewModel {
        
        let viewModel = AboutViewModel(about: user.about)
        
        return viewModel
    }
}
