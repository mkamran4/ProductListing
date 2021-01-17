//
//  Product.swift
//  Listing
//
//  Created by Mohammad on 16/01/2021.
//

import Foundation

// MARK: - Product
struct Product: Codable {
    let createdAt: String
    let price: String
    let name: String
    let uid: String
    let imageIds: [String]
    let imageUrls: [String]
    let imageUrlsThumbnails: [String]
}
