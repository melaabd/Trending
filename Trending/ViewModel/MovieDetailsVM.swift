//
//  MovieDetailsVM.swift
//  Trending
//
//  Created by melaabd on 2/26/22.
//

import Foundation

struct MovieDetailsVM {
    
    var movie:Movie
    
    var title:String {
        return movie.title
    }
    
    var releaseYear:String {
        return movie.releaseDate.getDateInYearFormat()
    }
    
    var rate:String {
        return "\(movie.voteAverage)"
    }
    
    var posterUrl:URL? {
        let fullPath = Keys.mediaBaseURL + movie.posterImageURLPath
        return URL(string: fullPath)
    }
    
}
