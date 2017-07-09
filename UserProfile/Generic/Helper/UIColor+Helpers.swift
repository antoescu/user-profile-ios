//
//  UIColor+Helpers.swift
//  UserProfile
//
//  Created by Antonio Escudero on 7/3/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(hex: Int, alpha: Float = 1.0) {
        
        self.init(
            red: CGFloat((hex >> 16) & 0xFF) / 255.0,
            green: CGFloat((hex >> 8) & 0xFF) / 255.0,
            blue: CGFloat(hex & 0xFF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    static func hex(_ value: Int, alpha: Float = 1.0) -> UIColor {
        
        return UIColor(hex: value, alpha: alpha)
    }
}
