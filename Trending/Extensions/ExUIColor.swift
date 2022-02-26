//
//  ExUIColor.swift
//  Trending
//
//  Created by melaabd on 2/25/22.
//

import UIKit

extension UIColor {
    
    static let backG = UIColor(hexString: "#262627")
    static let infoBackG = UIColor(hexString: "2E2E2E")
    static let prime = UIColor(hexString: "#C53249")
    static let txt = UIColor(hexString: "#797F88")
    
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.currentIndex = hexString.index(hexString.startIndex, offsetBy: 1)
        }
        
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}
