//
//  ListingTests.swift
//  ListingTests
//
//  Created by Mohammad on 16/01/2021.
//

import XCTest
@testable import Listing

class ListingTests: XCTestCase {

    private var testProduct: Product!
    private var productViewModel: ProductViewModel!
    
    override func setUpWithError() throws {
        testProduct = Product(
            createdAt: "24-02-22 10:03:22",
            price: "AED 60",
            name: "Sony LCD TV",
            uid: "299",
            imageIds: ["12121"],
            imageUrls: ["1212122"],
            imageUrlsThumbnails: ["2323233"]
        )
        
        productViewModel = ProductViewModel(testProduct)
    }

    func testPrice() throws {
        XCTAssertTrue(testProduct.price == productViewModel.price, "Should have the same value!")
    }
    
    func testName() throws {
        XCTAssertTrue(testProduct.name == productViewModel.name, "Should have the same value!")
    }
    
    func testDateFormat() throws {
        let firstComponent = testProduct.createdAt.components(separatedBy: ".").first ?? ""
        XCTAssertTrue(firstComponent == productViewModel.createdAt, "Should have the same value!")
    }
    
    func testImageUrls() throws {
        let urls = productViewModel.thumbnailScrollViewModel.imageUrls
        XCTAssertTrue(urls == testProduct.imageUrlsThumbnails, "Should have the same value!")
    }
    
    func testThumbnailUrls() throws {
        let urls = productViewModel.detailImageScrollViewModel.imageUrls
        XCTAssertTrue(urls == testProduct.imageUrls, "Should have the same value!")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
