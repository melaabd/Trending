//
//  MoviesBaseVC.swift
//  Trending
//
//  Created by melaabd on 2/27/22.
//

import UIKit

class MoviesBaseVC: UIViewController {
    
    var safeArea:UILayoutGuide!
    
    lazy var tableView:UITableView = {
        let tableV = UITableView()
        tableV.translatesAutoresizingMaskIntoConstraints = false
        tableV.backgroundColor = .clear
        tableV.showsVerticalScrollIndicator = false
        tableV.separatorStyle = .none
        return tableV
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBG()
        setupViews()
    }
    
    // MARK: - Setup Views
    func setupViews() {
        safeArea = view.layoutMarginsGuide
        
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    /// reload data in table view
    func reloadData() {
        GCD.onMain { [weak self] in
            self?.tableView.reloadData()
        }
    }

}

// MARK: - Conform wiht table view protocols
extension MoviesBaseVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - conform wiht commen protocols
extension MoviesBaseVC: ViewTheme, AlertDelegate {}
