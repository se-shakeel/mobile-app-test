//
//  MoviesListCell.swift
//  Movies Hub
//
//  Created by Shakeel on 1/20/23.
//

import UIKit
import SDWebImage

class MoviesListCell: UITableViewCell {
    
    @IBOutlet weak var imgMovieLogo: UIImageView!
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var lblMovieYear: UILabel!
    
    static let identifier = "MoviesListCell"
    private let imageHelper = ImageHelper()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imgMovieLogo.cornerRadius(8.0)
    }
    
    func setData(data: Movie) {
        lblMovieName.text = data.originalTitle
        lblMovieYear.text = data.releaseDate
        imageHelper.setImage(urlString: Constants.baseImgURL+data.posterPath, on: imgMovieLogo)
    }
}
