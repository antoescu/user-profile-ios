//
//  AboutCell.swift
//  UserProfile
//
//  Created by Antonio Escudero on 6/3/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import UIKit

class AboutCell: UITableViewCell {

    @IBOutlet fileprivate weak var label: UILabel!
    
    override func awakeFromNib() {
        
        self.label.textColor = .text
        self.label.font = .regular
        
        self.selectionStyle = .none
    }
}

extension AboutCell: GenericCell {

    internal func configure(value: AboutViewModel) {

        self.label.text = value.about
    }

}
