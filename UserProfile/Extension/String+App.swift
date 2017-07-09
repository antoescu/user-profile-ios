//
//  String+App.swift
//  UserProfile
//
//  Created by Antonio Escudero on 7/9/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import Foundation

extension String {

    var asPhoneFormat: String {
        
        guard self.characters.count >= 9 else {
            
            return self
        }
        
        let formatted = "(+34) \(self[0...2]) \(self[3...5]) \(self[6...8])"
        
        return formatted
    }
}
