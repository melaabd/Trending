//
//  EndPoint.swift
//  Trending
//
//  Created by melaabd on 2/26/22.
//

import Foundation

enum EndPoint: Router {
    
    case getMoviesList
    
    /// return endPoint's parameter `Parameters`
    var parameter: Parameters? {
        return nil
    }
    
    /// return endPoint's components `Parameters`
    var components: Component? {
        return ["api_key": Keys.apiKey]
    }
    
    /// return endPoint's path `String`
    var path : String {
        switch self {
        case .getMoviesList:
            return "discover/movie"
        }
    }
    
    /// return endPoint's`HTTPMethod`
    var method: HTTPMethod {
        return .get
    }
    
    /// return router's `HTTPHeaders`
    var headers: HTTPHeaders? {
        return nil
    }
    
}
