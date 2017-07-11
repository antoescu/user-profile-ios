//
//  NSObject+Helpers.swift
//  UserProfile
//
//  Created by Antonio Escudero on 6/4/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import UIKit

extension NSObject {
    
    static var className: String {
        
        return String(describing: self)
    }
    
    static var nibName: String {
        
        return self.className
    }
    
    static var nib: UINib {
        
        return UINib(nibName: self.nibName, bundle: .main)
    }
}
