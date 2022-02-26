//
//  ExUIFont.swift
//  Trending
//
//  Created by melaabd on 2/25/22.
//

import UIKit

enum FontWeight: String {
    case regular = "Regular"
    case bold = "Bold"
    case semibold = "Semibold"
}

extension UIFont {
    class func sfPro(fontWeight:FontWeight = .regular, size: CGFloat) -> UIFont {
        return UIFont(name: "SFProText-\(fontWeight.rawValue)", size: size) ?? .systemFont(ofSize: size)
    }
}
