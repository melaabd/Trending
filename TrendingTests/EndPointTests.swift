//
//  EndPointTests.swift
//  TrendingTests
//
//  Created by melaabd on 2/27/22.
//

import XCTest

@testable import Trending

class EndPointTests: XCTestCase {
    
    func testEndPoint() {
        
        let endpoint = EndPoint.getMoviesList
        let url = try! endpoint.asURL()
        let urlRequest = try! endpoint.getURLRequest()
        XCTAssertEqual(url.absoluteString, "https://api.themoviedb.org/3/discover/movie?api_key=c9856d0cb57c3f14bf75bdc6c063b8f3")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
        
    }
}
