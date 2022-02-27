//
//  ExtensionsTests.swift
//  TrendingTests
//
//  Created by melaabd on 2/27/22.
//

import XCTest
@testable import Trending

class ExtensionsTests: XCTestCase {

    func testStringExtension() {
        
        let string = "2022-02-27"
        XCTAssertEqual(string.getDateInYearFormat(), "2022")
    }

}
