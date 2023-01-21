//
//  MoviesListViewModel.swift
//  Movies Hub
//
//  Created by Shakeel on 1/20/23.
//

import Foundation
import UIKit

class MoviesListViewModel {
    
    func getMovies(in viewController: UIViewController, success:@escaping ([Movie]) -> Void, fail:@escaping (NSError) -> Void)  {
        LoadingIndicator.show(in: viewController)
        let url = APIManager.shared.getURLForMoviesList()
        APIManager.shared.getAPI(url: url) { (data, response, error) in
            if let error = error {
                fail(error as NSError)
                return
            }
            if let data = data {
                do {
                    let moviesListResponse = try JSONDecoder().decode(MoviesListModel.self, from: data)
                    success(moviesListResponse.results)
                } catch let error as NSError {
                    fail(error)
                }
            }
            LoadingIndicator.hide(in: viewController)
        }
    }
}
