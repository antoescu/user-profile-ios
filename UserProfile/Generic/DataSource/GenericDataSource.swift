//
//  GenericDataSource.swift
//  UserProfile
//
//  Created by Antonio Escudero on 6/3/17.
//  Copyright © 2017 Antonio Escudero. All rights reserved.
//

import UIKit

open class GenericDataSource: NSObject {
    
    fileprivate var values: [[(value: Any, reusableId: String)]] = []
    
    public final func set(values: [Any], reusableId: String, inSection section: Int) {
        
        self.checkSectionExists(at: section)
        
        self.values[section] = values.map { ($0, reusableId) }
    }
    
    public final func set(value: Any, reusableId: String, inSection section: Int, row: Int) {
            
        self.values[section][row] = (value, reusableId)
    }
    
    public final subscript(indexPath: IndexPath) -> Any {
        
        return self.values[indexPath.section][indexPath.item].value
    }
    
    public func configure(collectionView: UICollectionView) {}
    
    public func configure(tableView: UITableView) {}
    
    public final func register(cells: [UICollectionViewCell.Type], colllectionView: UICollectionView) {
        
        cells.forEach { colllectionView.register($0.nib, forCellWithReuseIdentifier: $0.className) }
    }
    
    public final func register(cells: [UITableViewCell.Type], tableView: UITableView) {
        
        cells.forEach { tableView.register($0.nib, forCellReuseIdentifier: $0.className) }
    }
    
    open func configureCell(collectionCell cell: UICollectionViewCell, withValue value: Any) {}
    
    open func configureCell(tableCell cell: UITableViewCell, withValue value: Any) {}
    
    private func checkSectionExists(at index: Int) {
        
        guard self.values.count <= index else { return }
        
        (self.values.count...index).forEach { _ in
            
            self.values.append([])
        }
    }
}

extension GenericDataSource: UICollectionViewDataSource {
    
    public final func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return self.values.count
    }
    
    public final func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.values[section].count
    }
    
    public final func collectionView(_ collectionView: UICollectionView,
                                     cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let (value, reusableId) = self.values[indexPath.section][indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableId, for: indexPath)
        
        self.configureCell(collectionCell: cell, withValue: value)
        
        return cell
    }
}

extension GenericDataSource: UITableViewDataSource {
    
    public final func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.values.count
    }
    
    public final func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.values[section].count
    }
    
    public final func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let (value, reusableId) = self.values[indexPath.section][indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableId, for: indexPath)
        
        self.configureCell(tableCell: cell, withValue: value)
        
        return cell
    }
}
