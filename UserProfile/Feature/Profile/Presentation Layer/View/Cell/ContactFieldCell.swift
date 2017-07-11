//
//  ContactFieldCell.swift
//  UserProfile
//
//  Created by Antonio Escudero on 7/1/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import UIKit

class ContactFieldCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var valueLabel: UILabel!
    @IBOutlet fileprivate weak var typeImageView: UIImageView!
    
    override func awakeFromNib() {
        
        self.valueLabel.textColor = .text
        self.valueLabel.font = .regular
        
        self.typeImageView.tintColor = .text
        
        self.selectionStyle = .none
    }
}

extension ContactFieldCell: GenericCell {
    
    internal func configure(value: ContactFieldViewModel) {
        
        self.valueLabel.text = value.value
        
        let imageName: String
        switch value.type {
            
        case .email:
            imageName = "envelope"
            
        case .phone:
            imageName = "phone-call"
            
        case .web:
            imageName = "avatar"
            
        case .github:
            imageName = "link"
            
        }
        
        let image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
        
        self.typeImageView.image = image
    }
}
