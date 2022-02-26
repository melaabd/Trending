//
//  TrendingMoviesVC.swift
//  Trending
//
//  Created by melaabd on 2/25/22.
//

import UIKit

class TrendingMoviesVC: UIViewController {
    
    lazy var tableView:UITableView = {
        let tableV = UITableView()
        tableV.translatesAutoresizingMaskIntoConstraints = false
        tableV.backgroundColor = .clear
        tableV.showsVerticalScrollIndicator = false
        tableV.separatorStyle = .none
        return tableV
    }()
    
    /// indecator for API calls
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.translatesAutoresizingMaskIntoConstraints = false
        return aiv
    }()
    
    var safeArea:UILayoutGuide!
    
    private var trendingMoviesVM:TrendingMoviesVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpBG(title: "Trending Movies")
        setupViews()
        trendingMoviesVM = TrendingMoviesVM()
        trendingMoviesVM?.delegate = self
        configureCompletions()
        trendingMoviesVM?.getMoviesListL()
    }


    
    // MARK: - Setup Views
    private func setupViews() {
        safeArea = view.layoutMarginsGuide
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        tableView.register(MovieTVCell.self, forCellReuseIdentifier: String(describing: MovieTVCell.self))
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

// MARK: - UITableViewDataSource
extension TrendingMoviesVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let noOfRows = trendingMoviesVM?.moviesDetailsVMs.count ?? 0
        noOfRows == 0 ? tableView.setEmptyView("No Movies Found") : tableView.setEmptyView()
        return noOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MovieTVCell.self), for: indexPath) as? MovieTVCell else {
            return UITableViewCell()
        }
        let cellVM = trendingMoviesVM?.moviesDetailsVMs[indexPath.row]
        cell.cellViewModel = cellVM
        cell.imgView.image = nil
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? MovieTVCell {
            guard let imgUrl = cell.cellViewModel?.movie.posterUrl else { return }
            ImgProvider.shared.requestImage(from: imgUrl, imgView: cell.imgView)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - conform with BindingDelegate protocol
extension TrendingMoviesVC: BindingDelegate {
    func reloadData() {
        GCD.onMain { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func notifyFailure(msg: String) {
        GCD.onMain { [weak self] in
            let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
            let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel)
            alert.addAction(dismissAction)
            self?.present(alert, animated: true)
        }
    }
}


// MARK: - Interactions Functions
private extension TrendingMoviesVC {
    /// configure completions from VM
    func configureCompletions() {
        trendingMoviesVM?.loadingCompletion = { isLoading in
            if isLoading {
                GCD.onMain { [weak self] in
                    self?.activityIndicatorView.startAnimating()
                }
            } else {
                GCD.onMain { [weak self] in
                    self?.activityIndicatorView.stopAnimating()
                }
            }
        }
    }
}
extension TrendingMoviesVC: ViewTheme {}
