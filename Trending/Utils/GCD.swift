//
//  GCD.swift
//  Trending
//
//  Created by melaabd on 2/26/22.
//

import Foundation

class GCD {
    
    ///  execute block of code in main thread
    /// - Parameters:
    ///   - after: `Int` delay in seconds
    ///   - execute:  clouser
    static func onMain(after: Int = 0, execute:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(after), execute: execute)
    }
}
