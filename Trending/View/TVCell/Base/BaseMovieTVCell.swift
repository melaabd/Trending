//
//  BaseMovieTVCell.swift
//  Trending
//
//  Created by melaabd on 2/27/22.
//

import UIKit

class BaseMovieTVCell: UITableViewCell {

    var cellViewModel: MovieDetailsVM? {
        didSet {
            updateFields()
        }
    }
    
    lazy var imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    lazy var titleLbl:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.textColor = .txt
        lbl.textAlignment = .center
        lbl.font = UIFont.sfPro(fontWeight: .bold, size: 18)
        return lbl
    }()
    
    lazy var releaseDateLbl:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .txt
        lbl.textAlignment = .center
        lbl.font = UIFont.sfPro(size: 16)
        return lbl
    }()
    
    lazy var rateLbl:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .prime
        lbl.textAlignment = .center
        lbl.font = UIFont.sfPro(fontWeight: .bold, size: 14)
        return lbl
    }()
    
    lazy var infoStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        
    }
    
    /// update the data in components
    func updateFields() {
        GCD.onMain { [weak self] in
            guard let self = self, let vm = self.cellViewModel else { return }
            self.titleLbl.text = vm.title
            self.releaseDateLbl.text = vm.releaseYear
            self.rateLbl.text = "🌟 \(vm.rate)"
        }
    }

}
