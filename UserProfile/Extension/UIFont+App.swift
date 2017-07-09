//
//  UIFont+App.swift
//  UserProfile
//
//  Created by Antonio Escudero on 7/3/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import UIKit

extension UIFont {
    
    internal static var hugeBold: UIFont {
        
        return UIFont.systemFont(ofSize: 22, weight: UIFontWeightBold)
    }
    
    internal static var bigBold: UIFont {
        
        return UIFont.systemFont(ofSize: 18, weight: UIFontWeightBold)
    }
    
    internal static var regular: UIFont {
        
        return UIFont.systemFont(ofSize: 14, weight: UIFontWeightRegular)
    }
    
    internal static var small: UIFont {
        
        return UIFont.systemFont(ofSize: 10, weight: UIFontWeightRegular)
    }
}
