//
//  ProfileViewController.swift
//  UserProfile
//
//  Created by Antonio Escudero on 6/3/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet fileprivate var tableView: UITableView!
    
    lazy fileprivate var loadingActivityIndicatorView: UIActivityIndicatorView = {
        
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        indicator.backgroundColor = .background
        
        self.view.addSubview(indicator)
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        indicator.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        indicator.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor).isActive = true
        indicator.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor).isActive = true
        
        return indicator
    }()
    
    private let presenter: ProfilePresenter
    fileprivate let dataSource: ProfileDataSource
    
    init(presenter: ProfilePresenter, dataSource: ProfileDataSource) {
        
        self.presenter = presenter
        self.dataSource = dataSource
        
        super.init(nibName: ProfileViewController.nibName, bundle: .main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Profile"
        
        self.configureTableView()
        
        self.presenter.viewDidLoad()
    }
    
    private func configureTableView() {
        
        self.dataSource.configure(tableView: self.tableView)
        self.dataSource.delegate = self.presenter
        
        self.tableView.delegate = self.dataSource
        
        self.tableView.backgroundColor = .background
        self.tableView.separatorColor = .secondary
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 80
        self.tableView.sectionHeaderHeight = 60
        
        self.tableView.tableFooterView = UIView()
    }
}

extension ProfileViewController: ProfileView {
    
    func startLoadingState() {
        
        self.loadingActivityIndicatorView.startAnimating()
    }
    
    func endLoadingState() {
        
        self.loadingActivityIndicatorView.stopAnimating()
    }
    
    func showErrorState() {
        
        assertionFailure("https://api.myjson.com/bins/afe5r seems not to be working")
    }
    
    func showHeader(with value: UserViewModel) {
     
        let header: ProfileHeaderView = .fromNib()
        
        header.configure(user: value)
        
        self.tableView.tableHeaderView = header
    }
    
    func showContactSection(with values: [ContactFieldViewModel]) {
        
        self.dataSource.addContactRows(with: values)
    }
    
    func showAboutSection(with values: AboutViewModel) {
        
        self.dataSource.addAboutRows(with: [values])
    }
    
    func showSkillsSection(with values: [SkillViewModel]) {
        
        self.dataSource.addSkillsRows(with: values)
    }
        
    internal func reload() {
        
        self.tableView?.reloadData()
    }
    
    internal func toggleContactSection(with values: [ContactFieldViewModel]) {
        
        self.tableView.beginUpdates()
        
        if self.dataSource.isContactSectionEmpty() {
            
            self.tableView.insertRows(at: self.dataSource.addContactRows(with: values), with: .middle)
            
        } else {
            
            self.tableView.deleteRows(at: self.dataSource.removeContactRows(), with: .middle)
        }
        
        self.tableView.endUpdates()
    }
    
    internal func toggleAboutSection(with value: AboutViewModel) {
        
        self.tableView.beginUpdates()
        
        if self.dataSource.isAboutSectionEmpty() {
            
            self.tableView.insertRows(at: self.dataSource.addAboutRows(with: [value]), with: .middle)
            
        } else {
            
            self.tableView.deleteRows(at: self.dataSource.removeAboutRows(), with: .middle)
        }
        
        self.tableView.endUpdates()
    }
    
    internal func toggleSkillsSection(with values: [SkillViewModel]) {
        
        self.tableView.beginUpdates()
        
        if self.dataSource.isSkillsSectionEmpty() {
            
            self.tableView.insertRows(at: self.dataSource.addSkillsRows(with: values), with: .middle)
            
        } else {
            
            self.tableView.deleteRows(at: self.dataSource.removeSkillsRows(), with: .middle)
        }
        
        self.tableView.endUpdates()
    }
}
