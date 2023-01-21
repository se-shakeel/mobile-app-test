//
//  MovieDetailsViewModel.swift
//  movies-hub
//
//  Created by Shakeel on 1/20/23.
//

import Foundation
import UIKit

class MovieDetailsViewModel {
    
    func getMovieDetails(movieId: Int, success:@escaping (Movie) -> Void, fail:@escaping (NSError) -> Void)  {
        let url = APIManager.shared.getURLForMovieDetials(movieId: movieId)
        APIManager.shared.getAPI(url: url) { (data, response, error) in
            if let error = error {
                fail(error as NSError)
                return
            }
            if let data = data {
                do {
                    let movieDetailsResponse = try JSONDecoder().decode(Movie.self, from: data)
                    success(movieDetailsResponse)
                } catch let error as NSError {
                    fail(error)
                }
            }
        }
    }
}

