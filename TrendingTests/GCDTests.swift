//
//  GCDTests.swift
//  TrendingTests
//
//  Created by melaabd on 2/27/22.
//

import XCTest

@testable import Trending

class GCDTests: XCTestCase {
    
    func testThreads() {
        
        GCD.onMain {
            XCTAssertTrue(Thread.current.isMainThread)
        }
        
    }
}
