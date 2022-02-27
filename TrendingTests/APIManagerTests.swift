//
//  APIManagerTests.swift
//  TrendingTests
//
//  Created by melaabd on 2/27/22.
//

import XCTest
@testable import Trending

class APIManagerTests: XCTestCase {

    var apiManager: APIManager!
    
    override func setUp() {
        super.setUp()
        
        apiManager = APIManager()
        
    }
    
    override func tearDown() {
        apiManager = nil
        super.tearDown()
    }
    
    func testInitialization() {
        XCTAssertNotNil(apiManager)
        let timeOut: TimeInterval = 60
        
        XCTAssertEqual(apiManager.session.configuration.timeoutIntervalForRequest, timeOut)
        XCTAssertEqual(apiManager.session.configuration.timeoutIntervalForResource, timeOut)
    }

}
