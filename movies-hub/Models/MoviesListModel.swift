//
//  MoviesListModel.swift
//  movies-hub
//
//  Created by Shakeel on 1/20/23.
//

import Foundation

struct MoviesListModel: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    var overview: String
    let originalTitle: String
    let releaseDate: String
    let posterPath: String

    private enum CodingKeys: String, CodingKey {
        case id
        case overview
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
    }
}
