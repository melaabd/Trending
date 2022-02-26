//
//  Services.swift
//  Trending
//
//  Created by melaabd on 2/26/22.
//

import Foundation

class Services {
    
    static var shared = Services() /// shared instance
    private var manager:APIManager!
    
    private init(){
       manager = APIManager()
    }
    
    /// get movies list
    /// - Parameters:
    ///   - completion: `([Movie]?, String?)`
    func getMoviesList(completion: @escaping ([Movie]?, String?) -> Void) {
        var getMoviesURLRequest:URLRequest!
        do {
            getMoviesURLRequest = try EndPoint.getMoviesList.getURLRequest()
        } catch {
            completion(nil, error.localizedDescription)
        }
        
        let task = manager.codableTask(with: getMoviesURLRequest) { (result: Result<Movies, NetworkError>) in
            switch result {
            case .success(let movies):
                completion(movies.results, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
        task.resume()
    }
}
