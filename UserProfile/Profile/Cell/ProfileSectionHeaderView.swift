//
//  ProfileSectionHeaderView.swift
//  UserProfile
//
//  Created by Antonio Escudero on 6/4/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import UIKit

class ProfileSectionHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var toggleButton: UIButton!
    
    override func awakeFromNib() {
        
        self.contentView.backgroundColor = .secondary
        
        self.nameLabel.textColor = .primary
        self.nameLabel.font = .bigBold
        
        self.toggleButton.setTitle("", for: .normal)
        self.toggleButton.setTitleColor(.text, for: .normal)
        self.toggleButton.titleLabel?.font = .small
    }
}

extension ProfileSectionHeaderView: GenericCell {
    
    internal func configure(value: String) {
        
        self.nameLabel.text = value
    }
}
