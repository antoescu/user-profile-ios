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
        
        self.tableView.delegate = self.dataSource
        
        self.tableView.backgroundColor = .background
        self.tableView.separatorColor = .secondary
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 100
        self.tableView.sectionHeaderHeight = 60
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
    
    internal func set(user: UserViewModel) {
        
        let header: ProfileHeaderView = .fromNib()
        
        header.configure(user: user)
        
        self.tableView.tableHeaderView = header
    }
    
    internal func set(contactFields: [ContactFieldViewModel]) {
        
        self.dataSource.load(contactFields: contactFields)
    }
    
    internal func set(about: AboutViewModel) {
        
        self.dataSource.load(about: about)
    }
    
    internal func set(skills: [SkillViewModel]) {
        
        self.dataSource.load(skills: skills)
    }
        
    internal func reload() {
        
        self.tableView?.reloadData()
    }
}
