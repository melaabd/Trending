//
//  MovieDetailsVMTests.swift
//  TrendingTests
//
//  Created by melaabd on 2/27/22.
//

import XCTest
@testable import Trending

class MovieDetailsVMTests: XCTestCase {
    
    func testDataStoring() {
        var movieDetailsVMs: [MovieDetailsVM] = []
        
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: "MoviesResponse", ofType: "json")
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped) else { return }
        let trendingMoviesResponse = try! JSONDecoder().decode(Movies.self, from: data)
        
        movieDetailsVMs = trendingMoviesResponse.results.map {MovieDetailsVM(movie: $0)}
        
        XCTAssertNotNil(movieDetailsVMs)
        XCTAssertNotNil(movieDetailsVMs.first)
        XCTAssertEqual(movieDetailsVMs.count, trendingMoviesResponse.results.count)

    }

}
