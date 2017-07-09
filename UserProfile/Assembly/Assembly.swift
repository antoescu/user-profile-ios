//
//  Assembly.swift
//  UserProfile
//
//  Created by Antonio Escudero on 7/9/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import Foundation

struct Assembly {
    
    fileprivate static let instance = Assembly()
    
    /**
     Prevent default initializer
     */
    private init() {}
}

func Assembler() -> Assembly {
    
    return Assembly.instance
}
