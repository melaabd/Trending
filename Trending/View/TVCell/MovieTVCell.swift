//
//  MovieTVCell.swift
//  Trending
//
//  Created by melaabd on 2/26/22.
//

import UIKit

class MovieTVCell: BaseMovieTVCell {

    lazy private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .infoBackG
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .clear
        
        contentView.addSubview(containerView)
        containerView.heightAnchor.constraint(equalToConstant: Utils.heightRatio(140)).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        
        containerView.addSubview(imgView)
        imgView.widthAnchor.constraint(equalToConstant: Utils.heightRatio(140) * 0.75).isActive = true
        imgView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        imgView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        imgView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        imgView.image = Asset.background.image
        
        let infoView = UIView()
        infoView.backgroundColor = .clear
        containerView.addSubview(infoView)
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 10).isActive = true
        infoView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        infoView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        infoView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        
        
        infoView.addSubview(infoStack)
        infoStack.centerYAnchor.constraint(equalTo: infoView.centerYAnchor).isActive = true
        infoStack.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive = true
        
        infoStack.topAnchor.constraint(greaterThanOrEqualTo: infoView.topAnchor).isActive = true
        infoStack.leadingAnchor.constraint(greaterThanOrEqualTo: infoView.leadingAnchor).isActive = true
        infoStack.trailingAnchor.constraint(lessThanOrEqualTo: infoView.trailingAnchor).isActive = true
        infoStack.bottomAnchor.constraint(lessThanOrEqualTo: infoView.bottomAnchor).isActive = true
        
        infoStack.addArrangedSubview(titleLbl)
        infoStack.addArrangedSubview(releaseDateLbl)
        infoStack.addArrangedSubview(rateLbl)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imgView.image = Asset.background.image
    }
}
