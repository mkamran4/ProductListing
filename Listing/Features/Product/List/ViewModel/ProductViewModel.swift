//
//  ProductViewModel.swift
//  Listing
//
//  Created by Mohammad on 16/01/2021.
//

import Foundation

struct ProductViewModel {
    
    private let product: Product
    
    // MARK: - Initialization
    init(_ product: Product) {
        self.product = product
    }
    
    var name: String { product.name }
    
    var price: String { product.price }
    
    var createdAt: String { product.createdAt.components(separatedBy: ".").first ?? "" }
    
    var thumbnailScrollViewModel: ImageScrollViewModel { .init(product.imageUrlsThumbnails) }
    
    var detailImageScrollViewModel: ImageScrollViewModel { .init(product.imageUrls) }
}
