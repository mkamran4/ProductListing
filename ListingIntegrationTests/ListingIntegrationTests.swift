//
//  ListingIntegrationTests.swift
//  ListingIntegrationTests
//
//  Created by Mohammad on 16/01/2021.
//

import XCTest
@testable import Listing

class ListingIntegrationTests: XCTestCase {

    private var repository: NetworkRepository!
    
    private var listViewModel: ProductListViewModel!
    
    override func setUpWithError() throws {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        repository = NetworkRepository(decoder)
        
        listViewModel = ProductListViewModel(repository)
    }

    func testRepository() throws {
        XCTAssertNotNil(repository != nil, "The repository should not be nil.")
        
        let respoExpectation = self.expectation(description: "Repository response retured!")
        repository.decodedObject(for: .listing) { (r: Result<Response, Error>) in
            switch r {
            case .success(_):
                respoExpectation.fulfill()
            case .failure(let error):
                XCTAssertThrowsError(error)
            }
        }
        waitForExpectations(timeout: 60, handler: nil)
    }
    
    func testViewModel() throws {
        XCTAssertNotNil(listViewModel != nil, "The listViewModel should not be nil.")
        
        let respoExpectation = self.expectation(description: "ViewModel response success!")
        listViewModel.didLoadProduct.bind { _ in
            respoExpectation.fulfill()
        }
        listViewModel.fetchProducts()
        waitForExpectations(timeout: 60, handler: nil)
    }
}
