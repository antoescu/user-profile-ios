//
//  SkillCell.swift
//  UserProfile
//
//  Created by Antonio Escudero on 6/3/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import UIKit

class SkillCell: UITableViewCell {

    @IBOutlet fileprivate weak var leftSeparatorView: UIView!
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var outerCircleView: UIView!
    @IBOutlet fileprivate weak var innerCircleView: UIView!
    
    override func awakeFromNib() {
        
        self.leftSeparatorView.backgroundColor = .secondary
        
        self.nameLabel.textColor = .text
        self.nameLabel.font = .regular
        
        self.outerCircleView.backgroundColor = .secondary
        self.outerCircleView.asCircle()
        self.outerCircleView.addBorder(width: 2, color: .secondary)
        
        self.innerCircleView.backgroundColor = .primary
        self.innerCircleView.asCircle()
        
        self.selectionStyle = .none
    }
}

extension SkillCell: GenericCell {
    
    internal func configure(value: SkillViewModel) {
        
        self.nameLabel.text = value.name
        
        let transform: CGAffineTransform
        switch value.expertise {
            
        case .high:
            transform = CGAffineTransform(scaleX: 1, y: 1)
            
        case .medium:
            transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            
        case .low:
            transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
        }
        
        self.innerCircleView.transform = transform
    }
}
