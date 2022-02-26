//
//  Keys.swift
//  Trending
//
//  Created by melaabd on 2/25/22.
//

import UIKit


enum Asset: String {
    case background
    case btnModel
    
    var image: UIImage? {
        return UIImage(named: rawValue)
    }
}

/// Holds constants keys for app
enum Keys {
    static let baseURL = "https://api.themoviedb.org/3/"
    static let mediaBaseURL = "https://image.tmdb.org/t/p/w500"
    static let apiKey = "c9856d0cb57c3f14bf75bdc6c063b8f3"
}
