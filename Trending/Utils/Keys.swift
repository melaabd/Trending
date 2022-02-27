//
//  Keys.swift
//  Trending
//
//  Created by melaabd on 2/25/22.
//

import UIKit


/// commen use Assets in app
enum Asset: String {
    case background
    case btnModel
    
    var image: UIImage? {
        return UIImage(named: rawValue)
    }
}

/// Holds constants keys for app
enum Keys {
    /// base url for APIs
    static let baseURL = "https://api.themoviedb.org/3/"
    
    /// images base url
    static let mediaBaseURL = "https://image.tmdb.org/t/p/w500"
    
    /// authnitication key for api
    static let apiKey = "c9856d0cb57c3f14bf75bdc6c063b8f3"
}
