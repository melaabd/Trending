//
//  ExString.swift
//  Trending
//
//  Created by melaabd on 2/27/22.
//

import Foundation

extension String {
    
    /// change date format
    /// - Returns: `String`
    func getDateInYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from:self) ?? Date()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date)
    }
}
