//
//  ProfilePresenter.swift
//  UserProfile
//
//  Created by Antonio Escudero on 6/3/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import Foundation

protocol ProfileView: class {
    
    func startLoadingState()
    func endLoadingState()
    func showErrorState()
    
    func set(user: UserViewModel)
    func set(contactFields: [ContactFieldViewModel])
    func set(about: AboutViewModel)
    func set(skills: [SkillViewModel])
    
    func reload()
}

class ProfilePresenter {
    
    internal weak var view: ProfileView?
    private let profileRepository: ProfileRepository
    private let userToViewModelMapper: UserToViewModelMapper
    private let aboutToViewModelMapper: AboutToViewModelMapper
    private let contactFieldsToViewModelMapper: ContactFieldsModelMapper
    private let skillToViewModelMapper: SkillToViewModelMapper
    
    init(profileRepository: ProfileRepository,
         userToViewModelMapper: UserToViewModelMapper,
         aboutToViewModelMapper: AboutToViewModelMapper,
         contactFieldsToViewModelMapper: ContactFieldsModelMapper,
         skillToViewModelMapper: SkillToViewModelMapper) {
        
        self.profileRepository = profileRepository
        self.userToViewModelMapper = userToViewModelMapper
        self.aboutToViewModelMapper = aboutToViewModelMapper
        self.contactFieldsToViewModelMapper = contactFieldsToViewModelMapper
        self.skillToViewModelMapper = skillToViewModelMapper
    }
    
    internal func viewDidLoad() {
        
        self.fetchCurrentUser()
    }
    
    private func fetchCurrentUser() {
        
        self.view?.startLoadingState()
        
        self.profileRepository.getUser(by: "") { user, _ in
            
            self.view?.endLoadingState()
            
            guard let user = user else {
                
                self.view?.showErrorState()
                
                return
            }
            
            let userViewModel = self.userToViewModelMapper.map(user)
            let aboutViewModel = self.aboutToViewModelMapper.map(user)
            let contactFieldViewModels = self.contactFieldsToViewModelMapper.map(user)
            let skillViewModels = self.skillToViewModelMapper.map(user.skills)
            
            self.view?.set(user: userViewModel)
            self.view?.set(contactFields: contactFieldViewModels)
            self.view?.set(about: aboutViewModel)
            self.view?.set(skills: skillViewModels)
            
            self.view?.reload()
        }
    }
}
