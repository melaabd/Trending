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
    
    var releaseDate:String {
        return movie.releaseDate
    }
    
    var rate:String {
        return "\(movie.voteAverage)"
    }
    
}
