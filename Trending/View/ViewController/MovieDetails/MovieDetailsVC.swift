//
//  MovieDetailsVC.swift
//  Trending
//
//  Created by melaabd on 2/27/22.
//

import UIKit

class MovieDetailsVC: MoviesBaseVC {

    var viewModel: MovieDetailsVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadData()
    }
    
    // MARK: - Setup Views
    override func setupViews() {
        super.setupViews()
        
        title = viewModel?.title
        setupLiftBarButton()
        tableView.register(MovieDetailsTVCell.self, forCellReuseIdentifier: String(describing: MovieDetailsTVCell.self))
        
    }
    
    private func setupLiftBarButton() {
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 72, height: 53))
        customView.backgroundColor = .clear
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = Asset.btnModel.image
        customView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: customView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: 40).isActive = true
        imageView.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: -20).isActive = true
        imageView.trailingAnchor.constraint(equalTo: customView.trailingAnchor).isActive = true
        
        let button: UIButton = UIButton()
        button.addTarget(self, action: #selector(actionLeft), for: .touchUpInside)
        button.backgroundColor = .clear
        button.setTitle("x", for: .normal)
        button.titleLabel?.font = UIFont.sfPro(fontWeight: .bold,size: 24)
        button.setTitleColor(.backG, for: .normal)
        customView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: customView.topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: customView.bottomAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: -50).isActive = true
        button.trailingAnchor.constraint(equalTo: customView.trailingAnchor).isActive = true
        
        let rightBarButtonItem:UIBarButtonItem = UIBarButtonItem()
        rightBarButtonItem.customView = customView

        self.navigationItem.leftBarButtonItem = rightBarButtonItem
    }
    
    /// right button action
    /// - Parameter sender: sender `UIButton`
    @objc private func actionLeft(sender: UIButton) {
        dismiss(animated: true)
    }
}

// MARK: - UITableViewDataSource
extension MovieDetailsVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MovieDetailsTVCell.self), for: indexPath) as? MovieDetailsTVCell ?? MovieDetailsTVCell()
        cell.selectionStyle = .none
        guard let vm = viewModel else { return cell }
        cell.cellViewModel = vm
        if let imgUrl = vm.posterUrl {
            ImgProvider.shared.requestImage(from: imgUrl, imgView: cell.imgView)
        }
        return cell
    }
}
