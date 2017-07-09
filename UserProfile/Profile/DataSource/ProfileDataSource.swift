//
//  ProfileDataSource.swift
//  UserProfile
//
//  Created by Antonio Escudero on 6/3/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import UIKit

class ProfileDataSource: GenericDataSource {
    
    internal enum Section: Int {
        
        case contact
        case about
        case skills
    }
    
    private let cells = [

        AboutCell.self,
        ContactFieldCell.self,
        SkillCell.self
    ]
    
    internal func load(contactFields: [ContactFieldViewModel]) {
        
        self.set(values: contactFields, reusableId: ContactFieldCell.className, inSection: Section.contact.rawValue)
    }
    
    internal func load(about: AboutViewModel) {
        
        self.set(values: [about], reusableId: AboutCell.className, inSection: Section.about.rawValue)
    }
    
    internal func load(skills: [SkillViewModel]) {
        
        self.set(values: skills, reusableId: SkillCell.className, inSection: Section.skills.rawValue)
    }
    
    override internal func configure(tableView: UITableView) {
        
        tableView.dataSource = self

        tableView.register(ProfileSectionHeaderView.self)
        
        self.register(cells: self.cells, tableView: tableView)
    }
    
    override internal func configureCell(tableCell cell: UITableViewCell, withValue value: Any) {
        
        switch (cell, value) {
            
        case let (cell as AboutCell, value as AboutViewModel):
            
            cell.configure(value: value)
            
        case let (cell as ContactFieldCell, value as ContactFieldViewModel):
            
            cell.configure(value: value)
        
        case let (cell as SkillCell, value as SkillViewModel):
            
            cell.configure(value: value)
        
        default:
            
            assertionFailure("Unrecognized (\(cell)), \((value)) combo.")
        }
    }
}

extension ProfileDataSource: UITableViewDelegate {
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView: ProfileSectionHeaderView = tableView.dequeueReusableHeaderFooterView()
        
        var name = ""
        if let profileSection = ProfileDataSource.Section(rawValue: section) {
            
            switch profileSection {
                
            case .contact:
                name = "Contact"
                
            case .about:
                name = "About"
                
            case .skills:
                name = "Skills"
            }
        }
        
        headerView.configure(value: name)
        
        return headerView
    }
}
