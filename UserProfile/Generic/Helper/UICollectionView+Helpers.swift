//
//  UICollectionView+Helpers.swift
//  UserProfile
//
//  Created by Antonio Escudero on 6/4/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_ : T.Type) {
        
        self.register(T.nib, forCellWithReuseIdentifier: T.className)
    }
    
    func register<T: UICollectionReusableView>(_ : T.Type, kind: String = UICollectionElementKindSectionHeader) {
        
        self.register(T.nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.className)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.className, for: indexPath) as? T else {
            
            fatalError("Could not dequeue cell with identifier: \(T.className)")
        }
        
        return cell
    }
    
    func dequeueReusableHeaderView<T: UICollectionReusableView>(forIndexPath indexPath: IndexPath) -> T {
        
        guard let view = self.dequeueReusableSupplementaryView(
            ofKind: UICollectionElementKindSectionHeader,
            withReuseIdentifier: T.className, for: indexPath) as? T else {
            
            fatalError("Could not dequeue header view with identifier: \(T.className)")
        }
        
        return view
    }
    
    func dequeueReusableFooterView<T: UICollectionReusableView>(forIndexPath indexPath: IndexPath) -> T {
        
        guard let view = self.dequeueReusableSupplementaryView(
            ofKind: UICollectionElementKindSectionFooter,
            withReuseIdentifier: T.className, for: indexPath) as? T else {
            
            fatalError("Could not dequeue footer view with identifier: \(T.className)")
        }
        
        return view
    }
}
