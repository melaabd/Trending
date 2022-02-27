//
//  TrendingMoviesVM.swift
//  Trending
//
//  Created by melaabd on 2/26/22.
//

import Foundation

class TrendingMoviesVM {
    
    weak var alertDelegate: AlertDelegate?
    
    var loading: StatusCompletion?
    var reload: Completion?
    
    var moviesDetailsVMs: [MovieDetailsVM] = []
    
    func getMoviesListL() {
        loading?(true)
        Services.shared.getMoviesList { [weak self] movies, err in
            guard let self = self else { return }
            self.loading?(false)
            if let errMsg = err {
                self.alertDelegate?.alertWith(msg: errMsg)
            } else if let movies = movies {
                self.moviesDetailsVMs = movies.map { MovieDetailsVM(movie: $0) }
                self.reload?()
            }
        }
    }
}
