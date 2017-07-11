//
//  ProfileDataSource.swift
//  UserProfile
//
//  Created by Antonio Escudero on 6/3/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import UIKit

protocol ProfileDataSourceDelegate: class {
    
    func didSelectToggleContactSection()
    func didSelectToggleAboutSection()
    func didSelectToggleSkillsSection()
}

class ProfileDataSource: GenericDataSource {
    
    fileprivate enum Section: Int {
        
        case contact
        case about
        case skills
    }
    
    private let cells = [

        AboutCell.self,
        ContactFieldCell.self,
        SkillCell.self
    ]
    
    internal weak var delegate: ProfileDataSourceDelegate?
    
    private func isSectionEmpty(_ section: Int) -> Bool {
        
        return self[section].count == 0
    }
    
    private func removeRows(of section: Int) -> [IndexPath] {
        
        let indexPaths = (0..<self[section].count).map { IndexPath(row: $0, section: section) }
        
        self.clearValues(at: section)
        
        return indexPaths
    }
    
    internal func isContactSectionEmpty() -> Bool {
        
        return self.isSectionEmpty(Section.contact.rawValue)
    }
    
    @discardableResult
    internal func addContactRows(with values: [ContactFieldViewModel]) -> [IndexPath] {
        
        return self.appendRows(with: values,
                               reusableId: ContactFieldCell.className,
                               toSection: Section.contact.rawValue)
    }
    
    internal func removeContactRows() -> [IndexPath] {
        
        return self.removeRows(of: Section.contact.rawValue)
    }
    
    internal func isAboutSectionEmpty() -> Bool {
        
        return self.isSectionEmpty(Section.about.rawValue)
    }
    
    @discardableResult
    internal func addAboutRows(with values: [AboutViewModel]) -> [IndexPath] {
        
        return self.appendRows(with: values,
                               reusableId: AboutCell.className,
                               toSection: Section.about.rawValue)
    }
    
    internal func removeAboutRows() -> [IndexPath] {
        
        return self.removeRows(of: Section.about.rawValue)
    }
    
    internal func isSkillsSectionEmpty() -> Bool {
        
        return self.isSectionEmpty(Section.skills.rawValue)
    }
    
    @discardableResult
    internal func addSkillsRows(with values: [SkillViewModel]) -> [IndexPath] {
        
        return self.appendRows(with: values,
                               reusableId: SkillCell.className,
                               toSection: Section.skills.rawValue)
    }
    
    internal func removeSkillsRows() -> [IndexPath] {
        
        return self.removeRows(of: Section.skills.rawValue)
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
    
    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView: ProfileSectionHeaderView = tableView.dequeueReusableHeaderFooterView()
        
        var name = ""
        var isSectionClosed = false
        if let profileSection = ProfileDataSource.Section(rawValue: section) {
            
            switch profileSection {
                
            case .contact:
                name = "Contact"
                isSectionClosed = self.isContactSectionEmpty()
                headerView.toggleButtonClosure = { self.delegate?.didSelectToggleContactSection() }
                
            case .about:
                name = "About"
                isSectionClosed = self.isAboutSectionEmpty()
                headerView.toggleButtonClosure = { self.delegate?.didSelectToggleAboutSection() }
                
            case .skills:
                name = "Skills"
                isSectionClosed = self.isSkillsSectionEmpty()
                headerView.toggleButtonClosure = { self.delegate?.didSelectToggleSkillsSection() }
            }
        }
        
        headerView.configureSection(with: name, isClosed: isSectionClosed)
        
        return headerView
    }
}
