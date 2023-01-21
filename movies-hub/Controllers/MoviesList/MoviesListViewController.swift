//
//  MoviesListViewController.swift
//  Movies Hub
//
//  Created by Shakeel on 1/20/23.
//

import UIKit

class MoviesListViewController: UIViewController {
    @IBOutlet weak var headerContainerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    private var arrMoviesList: [Movie] = []
    private let viewModel = MoviesListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
        fetchMovies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
}

// MARK: - Helper Methods
extension MoviesListViewController {
    
    private func configureUI() {
        headerContainerView.addBottomShadow(width: view.bounds.width)
    }
    
    private func configureTableView() {
        TableViewHelper.configureTableView(tableView, cellIdentifier: MoviesListCell.identifier)
    }
}

// MARK: - UITableViewDelegate and UITableViewDataSource
extension MoviesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMoviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MoviesListCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.setData(data: arrMoviesList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Router.shared.navigateToMovieDetails(from: self, movieId: arrMoviesList[indexPath.row].id)
    }
}

// MARK: - API Calling
extension MoviesListViewController {
    //MARK: - getting movies List with URLSession
    private func fetchMovies() {
        viewModel.getMovies(in: self) { [weak self] movies in
            guard let self = self else { return }
            self.arrMoviesList = movies
            self.tableView.reloadData()
        } fail: { error in
            print(error.localizedDescription)
        }
    }
}
