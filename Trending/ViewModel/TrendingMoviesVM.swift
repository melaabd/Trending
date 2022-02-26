//
//  TrendingMoviesVM.swift
//  Trending
//
//  Created by melaabd on 2/26/22.
//

import Foundation

/// Binding Delegate
protocol BindingDelegate: AnyObject {
    func reloadData()
    func notifyFailure(msg: String)
}

class TrendingMoviesVM {
    
    weak var delegate: BindingDelegate?
    var loadingCompletion: StatusCompletion?
    var moviesDetailsVMs: [MovieDetailsVM] = []
    
    func getMoviesListL() {
        loadingCompletion?(true)
        Services.shared.getMoviesList { [weak self] movies, err in
            guard let self = self else { return }
            self.loadingCompletion?(false)
            if let errMsg = err {
                self.delegate?.notifyFailure(msg: errMsg)
            } else if let movies = movies {
                self.moviesDetailsVMs = movies.map { MovieDetailsVM(movie: $0) }
                self.delegate?.reloadData()
            }
        }
    }
}
