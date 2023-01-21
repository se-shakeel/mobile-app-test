//
//  Router.swift
//  movies-hub
//
//  Created by Shakeel on 1/21/23.
//

import UIKit

class Router {
    static let shared = Router()

    func navigateToMovieDetails(from viewController: UIViewController, movieId: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let movieDetailsViewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        movieDetailsViewController.movieId = movieId
        viewController.navigationController?.pushViewController(movieDetailsViewController, animated: true)
    }
}
