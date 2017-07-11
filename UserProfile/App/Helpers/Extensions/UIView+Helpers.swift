//
//  UIView+Helpers.swift
//  UserProfile
//
//  Created by Antonio Escudero on 6/4/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import UIKit

extension UIView {
    
    func asCircle() {
        
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = true
    }
    
    func addBorder(width: CGFloat, color: UIColor) {
        
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    
    class func fromNib<T: UIView>() -> T {
        
        guard let view = Bundle.main.loadNibNamed(T.className, owner: nil, options: nil)?.first as? T else {
            
            fatalError("Could not load nib view named: \(T.className)")
        }
        
        return view
    }
}
