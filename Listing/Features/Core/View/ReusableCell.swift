//
//  ReusableCell.swift
//  Listing
//
//  Created by Mohammad on 16/01/2021.
//

import UIKit

protocol ReusableCell: class {
    static var resueIdentifier: String { get }
}

extension ReusableCell {
    
    static var resueIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableCell, NibReusableCell {}

protocol NibReusableCell {
    static var nib: UINib? { get }
}

extension NibReusableCell {
    
    static var nib: UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}

extension UITableView {
    
    func dequeueReusableCell<T: ReusableCell>() -> T {
        return self.dequeueReusableCell(withIdentifier: T.resueIdentifier) as! T
    }
    
    func registerCell<T: ReusableCell>(_: T.Type) {
        self.register(T.self, forCellReuseIdentifier: T.resueIdentifier)
    }
    
    func registerCell<T: NibReusableCell&ReusableCell>(_: T.Type) {
        if let nib = T.nib {
            self.register(nib, forCellReuseIdentifier: T.resueIdentifier)
        } else {
            self.registerCell(T.self)
        }
    }
}

/// UICollectionViewCell conformance to ReusableCell & NibReusableCell
extension UICollectionViewCell: ReusableCell, NibReusableCell {}

// MARK: - UICollectionView helper method for reusableCell
extension UICollectionView {
    
    func dequeueReusableCell<T: ReusableCell>(for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: T.resueIdentifier, for: indexPath) as! T
    }
    
    func registerCell<T: ReusableCell>(_: T.Type) {
        self.register(T.self, forCellWithReuseIdentifier: T.resueIdentifier)
    }
    
    func registerCell<T: NibReusableCell&ReusableCell>(_: T.Type) {
        if let nib = T.nib {
            self.register(nib, forCellWithReuseIdentifier: T.resueIdentifier)
        } else {
            self.registerCell(T.self)
        }
    }
}
