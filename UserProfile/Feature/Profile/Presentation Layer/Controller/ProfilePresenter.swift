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
    
    func showHeader(with value: UserViewModel)
    func showContactSection(with values: [ContactFieldViewModel])
    func showAboutSection(with values: AboutViewModel)
    func showSkillsSection(with values: [SkillViewModel])
    
    func toggleContactSection(with value: [ContactFieldViewModel])
    func toggleAboutSection(with value: AboutViewModel)
    func toggleSkillsSection(with value: [SkillViewModel])
    
    func reload()
}

class ProfilePresenter {
    
    internal weak var view: ProfileView?
    
    fileprivate let profileRepository: ProfileRepository
    fileprivate let userToViewModelMapper: UserToViewModelMapper
    fileprivate let aboutToViewModelMapper: AboutToViewModelMapper
    fileprivate let contactFieldsToViewModelMapper: ContactFieldsModelMapper
    fileprivate let skillToViewModelMapper: SkillToViewModelMapper
    
    fileprivate var user: User?
    
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
        
        self.profileRepository.getUser(by: "") { [weak self] user, _ in
            
            self?.view?.endLoadingState()
            
            guard let user = user else {
                
                self?.view?.showErrorState()
                
                return
            }
            
            self?.user = user
            
            self?.show(user: user)
        }
    }
    
    private func show(user: User) {
        
        let userViewModel = self.userToViewModelMapper.map(user)
        let aboutViewModel = self.aboutToViewModelMapper.map(user)
        let contactFieldViewModels = self.contactFieldsToViewModelMapper.map(user)
        let skillViewModels = self.skillToViewModelMapper.map(user.skills)
        
        self.view?.showHeader(with: userViewModel)
        self.view?.showContactSection(with: contactFieldViewModels)
        self.view?.showAboutSection(with: aboutViewModel)
        self.view?.showSkillsSection(with: skillViewModels)
        
        self.view?.reload()
    }
}

extension ProfilePresenter: ProfileDataSourceDelegate {
    
    internal func didSelectToggleContactSection() {
        
        guard let user = self.user else { return }
        
        let contactFieldViewModels = self.contactFieldsToViewModelMapper.map(user)
        
        self.view?.toggleContactSection(with: contactFieldViewModels)
    }
    
    internal func didSelectToggleAboutSection() {
        
        guard let user = self.user else { return }
        
        let aboutViewModel = self.aboutToViewModelMapper.map(user)
        
        self.view?.toggleAboutSection(with: aboutViewModel)
    }
    
    internal func didSelectToggleSkillsSection() {
        
        guard let user = self.user else { return }
        
        let skillViewModels = self.skillToViewModelMapper.map(user.skills)
        
        self.view?.toggleSkillsSection(with: skillViewModels)
    }
}
