//
//  Observable.swift
//  Listing
//
//  Created by Mohammad on 16/01/2021.
//

import Foundation

class Observable<T> {
    
    /// Helper definition
    typealias Binding = (T) -> ()
    
    /// Binding closuer to notify the ovserver about the value change
    var binding: Binding?
    
    /// Binding the value to observer
    /// - parameter binding: Observing callback to listen the value change event
    /// - returns: Self object for chaining
    @discardableResult
    func bind(_ binding: Binding?) -> Self {
        self.binding = binding
        return self
    }
    
    /// Unbinding the observer
    func unbind() {
        self.binding = nil
    }
    
    /// Notifying the observer
    func fire() {
        self.binding?(self.value)
    }
    
    /// Generic observable value
    var value: T {
        didSet {
            binding?(value)
        }
    }
    
    // MARK: - Initialization
    init(_ value: T) {
        self.value = value
    }
}
