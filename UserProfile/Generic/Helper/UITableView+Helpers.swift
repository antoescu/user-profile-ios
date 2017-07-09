//
//  UITableView+Helpers.swift
//  UserProfile
//
//  Created by Antonio Escudero on 6/4/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_ : T.Type) {
        
        self.register(T.nib, forCellReuseIdentifier: T.className)
    }
    
    func register<T: UITableViewHeaderFooterView>(_ : T.Type) {
        
        self.register(T.nib, forHeaderFooterViewReuseIdentifier: T.className)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        
        guard let cell = self.dequeueReusableCell(withIdentifier: T.className, for: indexPath) as? T else {
            
            fatalError("Could not dequeue cell with identifier: \(T.className)")
        }
        
        return cell
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T {
        
        guard let view = self.dequeueReusableHeaderFooterView(withIdentifier: T.className) as? T else {
            
            fatalError("Could not dequeue header footer view with identifier: \(T.className)")
        }
        
        return view
    }
}
