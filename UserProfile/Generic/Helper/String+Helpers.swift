//
//  String+Helpers.swift
//  UserProfile
//
//  Created by Antonio Escudero on 7/2/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import Foundation

extension String {
    
    subscript(index: Int) -> Character {
        
        return self[self.characters.index(self.startIndex, offsetBy: index)]
    }
    
    subscript(index: Int) -> String {
        
        return String(self[index] as Character)
    }
    
    subscript(range: Range<Int>) -> String {
        
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(startIndex, offsetBy: range.upperBound)
        
        return self[start..<end]
    }
    
    subscript(range: ClosedRange<Int>) -> String {
        
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(startIndex, offsetBy: range.upperBound)
        
        return self[start...end]
    }
}
