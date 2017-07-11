//
//  Assembly+Profile.swift
//  UserProfile
//
//  Created by Antonio Escudero on 7/9/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import UIKit

extension Assembly {
    
    internal func provideProfileNavigationController() -> UIViewController {
        
        let viewController = Assembler().provideProfileViewController()
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barTintColor = .primary
        navigationController.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.text
        ]
        
        return navigationController
    }
    
    internal func provideProfileViewController() -> ProfileViewController {
        
        let presenter = ProfilePresenter(
            profileRepository: DefaultProfileRepository(),
            userToViewModelMapper: UserToViewModelMapper(),
            aboutToViewModelMapper: AboutToViewModelMapper(),
            contactFieldsToViewModelMapper: ContactFieldsModelMapper(),
            skillToViewModelMapper: SkillToViewModelMapper()
        )
        
        let viewController = ProfileViewController(
            presenter: presenter,
            dataSource: ProfileDataSource()
        )
        
        presenter.view = viewController
        
        return viewController
    }
}
