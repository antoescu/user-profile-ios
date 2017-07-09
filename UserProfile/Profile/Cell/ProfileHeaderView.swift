//
//  ProfileHeaderView.swift
//  UserProfile
//
//  Created by Antonio Escudero on 6/4/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import UIKit
import AlamofireImage

class ProfileHeaderView: UIView {

    @IBOutlet fileprivate weak var firstNameLabel: UILabel!
    @IBOutlet fileprivate weak var lastNameLabel: UILabel!
    @IBOutlet fileprivate weak var careerLabel: UILabel!
    @IBOutlet fileprivate weak var pictureImageView: UIImageView!
    
    override func awakeFromNib() {
        
        self.firstNameLabel.textColor = .text
        self.firstNameLabel.font = .hugeBold
        
        self.lastNameLabel.textColor = .text
        self.lastNameLabel.font = .regular
        
        self.careerLabel.textColor = .primary
        self.careerLabel.font = .bigBold
        
        self.pictureImageView.asCircle()
    }
    
    internal func configure(user: UserViewModel) {
        
        self.firstNameLabel.text = user.firstName
        self.lastNameLabel.text = user.lastName
        self.careerLabel.text = user.career
        
        if let url = user.pictureUrl {
            
            self.pictureImageView.af_setImage(withURL: url)
        }
    }

}
