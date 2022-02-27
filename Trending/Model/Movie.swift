//
//  Movie.swift
//  Trending
//
//  Created by melaabd on 2/25/22.
//

import Foundation

struct Movies: Codable {
    let results: [Movie]
}

struct Movie: Codable, Equatable {
    let id: Int
    let title: String
    let releaseDate: String
    let overview: String
    let posterImageURLPath: String
    let voteAverage: Float
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case releaseDate = "release_date"
        case overview = "overview"
        case posterImageURLPath = "poster_path"
        case voteAverage = "vote_average"
    }
}
