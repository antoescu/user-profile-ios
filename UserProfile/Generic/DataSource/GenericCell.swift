//
//  GenericCell.swift
//  UserProfile
//
//  Created by Antonio Escudero on 6/3/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import Foundation

public protocol GenericCell {
    
    associatedtype Value
    
    func configure(value: Value)
}
