//
//  ProductListViewModel.swift
//  Listing
//
//  Created by Mohammad on 16/01/2021.
//

import Foundation

class ProductListViewModel: ViewModel {
    
    private var products: [ProductViewModel] = [] {
        didSet {
            self.didLoadProduct.value = true
        }
    }
    
    let didLoadProduct = Observable(false)
    
    var numberOfRows: Int { products.count }
    
    func productViewModel(at index: Int) -> ProductViewModel? {
        guard index < products.count else { return nil }
        return products[index]
    }
    
    func fetchProducts() {
        processRequest(.listing) { [weak self] (response: Response) in
            self?.products = response.results.map { ProductViewModel($0) }
        }
    }
}
