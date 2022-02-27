//
//  BackgroundProtocol.swift
//  Trending
//
//  Created by melaabd on 2/25/22.
//

import UIKit

/// App back ground theme
protocol ViewTheme: UIViewController {
    func setUpBG(title: String)
}

extension ViewTheme {
    /// set attrebutes for view title and default background
    /// - Parameter title: `String`
    func setUpBG(title: String = "") {
        view.backgroundColor = .backG
        self.title = title
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.prime,
            .font: UIFont.sfPro(fontWeight: .bold, size: 18)
        ]
        
        let backGroundImgView = UIImageView()
        view.addSubview(backGroundImgView)
        backGroundImgView.translatesAutoresizingMaskIntoConstraints = false
        backGroundImgView.heightAnchor.constraint(equalToConstant: Utils.heightRatio(238)).isActive = true
        backGroundImgView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backGroundImgView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backGroundImgView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backGroundImgView.image = Asset.background.image
        
    }
}
