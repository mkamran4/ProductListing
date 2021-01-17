//
//  Bindable.swift
//  Listing
//
//  Created by Mohammad on 16/01/2021.
//

import UIKit

struct AssociatedKeys {
    
    static var bindableKey: UInt = 0
}

protocol Bindable: class {
    
    associatedtype VM
    
    var viewModel: VM? { get set }
    
    func bind(_ viewModel: VM)
    
    func initializeBindings()
}

extension Bindable {
    
    var viewModel: VM? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.bindableKey) as? VM
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.bindableKey, newValue, .OBJC_ASSOCIATION_RETAIN)
            
            initializeBindings()
        }
    }
}

extension Bindable where Self: UIViewController, VM: ViewModel {
    
    func initializeBindings() {
        guard let viewModel = self.viewModel else { return }
        viewModel.isProgress.bind { shouldShow in
            if shouldShow {
//                MKProgress.show()
            } else {
//                MKProgress.hide()
            }
        }
        
        viewModel.errorMessage.bind { [weak self] message in
            guard let self = self, let message = message else { return }
            Alert.show(on: self, message: message)
        }
        self.bind(viewModel)
    }
}
