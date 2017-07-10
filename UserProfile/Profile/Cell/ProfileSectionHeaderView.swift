//
//  ProfileSectionHeaderView.swift
//  UserProfile
//
//  Created by Antonio Escudero on 6/4/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import UIKit

typealias ToggleButtonClosure = () -> Void

class ProfileSectionHeaderView: UITableViewHeaderFooterView {

    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet private weak var toggleButton: UIButton!
    
    fileprivate var isToggleButtonInClosedState: Bool = false
    
    internal var toggleButtonClosure: ToggleButtonClosure?
    
    override func awakeFromNib() {
        
        self.contentView.backgroundColor = .secondary
        
        self.nameLabel.textColor = .primary
        self.nameLabel.font = .bigBold
        
        self.toggleButton.setTitleColor(.text, for: .normal)
        self.toggleButton.titleLabel?.font = .small
    }
    
    @IBAction private func toggleButtonTapped(_ sender: UIButton) {
        
        self.isToggleButtonInClosedState = !self.isToggleButtonInClosedState
        self.updateToggleButtonTitle()
        
        self.toggleButtonClosure?()
    }
    
    fileprivate func updateToggleButtonTitle() {
        
        self.toggleButton.setTitle((self.isToggleButtonInClosedState) ? "Open" : "Close", for: .normal)
    }
    
    internal func configureSection(with name: String, isClosed: Bool) {
        
        self.nameLabel.text = name
        
        self.isToggleButtonInClosedState = isClosed
        self.updateToggleButtonTitle()
    }
}
