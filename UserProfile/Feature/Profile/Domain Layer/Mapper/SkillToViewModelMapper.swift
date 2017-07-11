//
//  SkillToViewModelMapper.swift
//  UserProfile
//
//  Created by Antonio Escudero on 6/3/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import UIKit

struct SkillToViewModelMapper: Mappable {
    
    internal func map(_ skill: Skill) -> SkillViewModel {
        
        let viewModel = SkillViewModel(
            name: skill.name,
            expertise: self.getExpertise(for: skill.rating)
        )
        
        return viewModel
    }
    
    private func getExpertise(for rating: Int) -> SkillViewModel.Expertise {
        
        switch rating {
            
        case .min...2:
            return .low
            
        case 3:
            return .medium
            
        default:
            return .high
        }
    }
}
