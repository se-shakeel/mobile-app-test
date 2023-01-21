//
//  APIManager.swift
//  movies-hub
//
//  Created by Shakeel on 1/20/23.
//

import Foundation

class APIManager {
    
    static let shared: APIManager =  APIManager()
    
    func getAPI(url: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        guard let apiURL = URL(string: url) else { return }
        URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, response, error)
            }
        }.resume()
    }
}

extension APIManager {
    // getting API Key
    func getApiKey() -> String {
        let path = Bundle.main.path(forResource: "Info", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        if let apiKey = dict?["APIKey"] as? String {
            return apiKey
        }
        return ""
    }

    // getting movies list url
    func getURLForMoviesList() -> String {
        return Constants.baseURL + "discover/movie" + getApiKey()
    }
    
    // getting movie details url
    func getURLForMovieDetials(movieId: Int) -> String {
        return "\(Constants.baseURL)movie/\(movieId)"+getApiKey()
    }
}
