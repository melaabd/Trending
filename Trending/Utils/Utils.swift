//
//  Utils.swift
//  Trending
//
//  Created by melaabd on 2/25/22.
//

import UIKit

typealias StatusCompletion = ((_ isLoading:Bool)->Void)
typealias Completion = (()->Void)

class Utils {
    
    /// get dynamic height depending on screen height
    /// - Parameter staticHeight: `CGFloat`
    /// - Returns: `CGFloat`
    static func heightRatio(_ staticHeight: CGFloat) -> CGFloat {
        let sh = UIScreen.main.bounds.height
        return (staticHeight/667)*sh
    }
}
