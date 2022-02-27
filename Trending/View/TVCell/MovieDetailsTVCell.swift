//
//  MovieDetailsTVCell.swift
//  Trending
//
//  Created by melaabd on 2/27/22.
//

import UIKit

class MovieDetailsTVCell: BaseMovieTVCell {

    lazy var overViewLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .txt
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.font = UIFont.sfPro(size: 16)
        return lbl
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(imgView)
        imgView.heightAnchor.constraint(equalToConstant: Utils.heightRatio(375)).isActive = true
        imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imgView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        
        imgView.contentMode = .scaleAspectFill
        imgView.image = Asset.background.image
        
        contentView.addSubview(infoStack)
        infoStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        infoStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        infoStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50).isActive = true
        infoStack.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 75).isActive = true
        
        infoStack.addArrangedSubview(titleLbl)
        infoStack.addArrangedSubview(releaseDateLbl)
        infoStack.addArrangedSubview(rateLbl)
        infoStack.addArrangedSubview(overViewLbl)
    }
    
    override func updateFields() {
        super.updateFields()
        
        GCD.onMain { [weak self] in
            guard let self = self, let vm = self.cellViewModel else { return }
            self.overViewLbl.text = vm.movie.overview
        }
    }
    
}
