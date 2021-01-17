//
//  ProductDetailViewModel.swift
//  Listing
//
//  Created by Mohammad on 16/01/2021.
//

import Foundation

enum ProductDetailType {
    case header(ImageScrollViewModel?)
    case text(String)
}

class ProductDetailViewModel: ViewModel {
    
    private var productViewModel: ProductViewModel
    
    private var dataSource: [ProductDetailType] = []
    
    // MARK: - Initialization
    init(_ productViewModel: ProductViewModel, repository: NetworkRepository = NetworkRepository()) {
        self.productViewModel = productViewModel
        super.init(repository)
        
        self.dataSource = [
            .header(productViewModel.detailImageScrollViewModel),
            .text(productViewModel.price),
            .text(productViewModel.name),
            .text(productViewModel.createdAt)
        ]
    }
    
    var numberOfRows: Int { dataSource.count }
    
    func detail(at index: Int) -> ProductDetailType? {
        if index < dataSource.count {
            return self.dataSource[index]
        }
        return nil
    }
}
