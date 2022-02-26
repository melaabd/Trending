//
//  ExUITableView.swift
//  Trending
//
//  Created by melaabd on 2/26/22.
//

import UIKit
extension UITableView {
    
    /// add placeholder view to show that table view doesn't have items
    /// - Parameter title: no items message `String`
    func setEmptyView(_ title: String? = nil) {
        guard let title = title else {
            backgroundView = nil
            return
        }
        let emptyView = UIView(frame: CGRect(x: center.x, y: center.y, width: bounds.size.width, height: bounds.size.height))
        emptyView.backgroundColor = .clear
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .darkGray
        titleLabel.font = UIFont.sfPro(fontWeight: .bold, size: 24)
        emptyView.addSubview(titleLabel)
        
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        
        titleLabel.text = title
        backgroundView = emptyView
        separatorStyle = .none
    }
}
