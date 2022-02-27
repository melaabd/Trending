//
//  TrendingMoviesVMTests.swift
//  TrendingTests
//
//  Created by melaabd on 2/27/22.
//

import XCTest
@testable import Trending

class TrendingMoviesVMTests: XCTestCase {

    var trendingMoviesVM: TrendingMoviesVM!
    
    override func setUp() {
        super.setUp()
        
        trendingMoviesVM = TrendingMoviesVM()
        
    }
    
    override func tearDown() {
        trendingMoviesVM = nil
        super.tearDown()
    }

    func testInitialization() {
        XCTAssertNotNil(trendingMoviesVM)
    }
    
    func testDataStoring() {
        
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: "MoviesResponse", ofType: "json")
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped) else { return }
        let trendingMoviesResponse = try! JSONDecoder().decode(Movies.self, from: data)
        
        XCTAssertNotNil(trendingMoviesResponse)
        XCTAssertNotNil(trendingMoviesResponse.results.first)
        XCTAssertEqual(trendingMoviesResponse.results.first?.id, 634649)

    }

}
