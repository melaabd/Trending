//
//  TrendingMoviesVC.swift
//  Trending
//
//  Created by melaabd on 2/25/22.
//

import UIKit

class TrendingMoviesVC: MoviesBaseVC {
        
    /// indecator for API calls
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.translatesAutoresizingMaskIntoConstraints = false
        return aiv
    }()
    
    private var trendingMoviesVM: TrendingMoviesVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trendingMoviesVM = TrendingMoviesVM()
        trendingMoviesVM?.alertDelegate = self
        configureCompletions()
        trendingMoviesVM?.getMoviesListL()
    }


    
    // MARK: - Setup Views
    override func setupViews() {
        super.setupViews()
                
        title = "Trending Movies"
        tableView.register(MovieTVCell.self, forCellReuseIdentifier: String(describing: MovieTVCell.self))
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }

}

// MARK: - UITableViewDataSource
extension TrendingMoviesVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let noOfRows = trendingMoviesVM?.moviesDetailsVMs.count ?? 0
        noOfRows == 0 ? tableView.setEmptyView("No Movies Found") : tableView.setEmptyView()
        return noOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MovieTVCell.self), for: indexPath) as? MovieTVCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        let cellVM = trendingMoviesVM?.moviesDetailsVMs[indexPath.row]
        cell.cellViewModel = cellVM
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let cell = cell as? MovieTVCell, let imgUrl = cell.cellViewModel?.posterUrl else { return }
        ImgProvider.shared.requestImage(from: imgUrl, imgView: cell.imgView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailsVM = trendingMoviesVM?.moviesDetailsVMs[indexPath.row] else { return }
        showDtails(detailsVM: detailsVM)
    }

}

// MARK: - Interactions Functions
private extension TrendingMoviesVC {
    /// configure completions from VM
    func configureCompletions() {
        trendingMoviesVM?.reload = { [weak self] in
            self?.reloadData()
        }
        
        trendingMoviesVM?.loading = { isLoading in
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
    
    func showDtails(detailsVM: MovieDetailsVM) {
        let navbar = UINavigationController()
        let detailsVC = MovieDetailsVC()
        detailsVC.viewModel = detailsVM
        navbar.viewControllers.append(detailsVC)
        present(navbar, animated: true)
    }
}
