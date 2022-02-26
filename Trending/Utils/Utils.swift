//
//  Utils.swift
//  Trending
//
//  Created by melaabd on 2/25/22.
//

import UIKit

typealias StatusCompletion = ((_ isLoading:Bool)->Void)

class Utils {
    
    static func heightRatio(_ staticHeight: CGFloat) -> CGFloat {
        let sh = UIScreen.main.bounds.height
        return (staticHeight/667)*sh
    }
}
