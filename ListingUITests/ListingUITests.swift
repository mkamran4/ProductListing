//
//  ListingUITests.swift
//  ListingUITests
//
//  Created by Mohammad on 16/01/2021.
//

import XCTest
@testable import Listing

class ListingUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        let app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
