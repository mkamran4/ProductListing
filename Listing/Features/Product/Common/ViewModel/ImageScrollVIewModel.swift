//
//  ImageScrollVIewModel.swift
//  Listing
//
//  Created by Mohammad on 16/01/2021.
//

import Foundation

struct ImageScrollViewModel {
    
    private(set) var imageUrls: [String] = []
    
    // MARK: - Initialization
    init(_ imageUrls: [String]) {
        self.imageUrls = imageUrls
    }
    
    var numberOfRows: Int { imageUrls.count }
    
    func imageUrl(at index: Int) -> URL? {
        if index < imageUrls.count {
            return URL(string: imageUrls[index])
        }
        return nil
    }
}
