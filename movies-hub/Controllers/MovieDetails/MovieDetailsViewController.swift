//
//  MovieDetailsViewController.swift
//  Movies Hub
//
//  Created by Shakeel on 1/20/23.
//

import UIKit
import SDWebImage

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var headerContainerView: UIView!
    @IBOutlet weak var imgMoviewBanner: UIImageView!
    @IBOutlet weak var lblMoviewName: UILabel!
    @IBOutlet weak var lblMoviewYear: UILabel!
    @IBOutlet weak var lblMoviewDesc: UITextView!
    
    private let viewModel = MovieDetailsViewModel()
    private let imageHelper = ImageHelper()
    var movieId = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        
        getMovieDetails(movieId: movieId)
    }
    
    @IBAction func onBtnBack(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Helper Methods
extension MovieDetailsViewController {
    
    private func setupUI() {
        headerContainerView.addBottomShadow(width: view.bounds.width)
        imgMoviewBanner.cornerRadius(8.0)
    }
    
    private func setupData(data: Movie) {
        lblMoviewName.text = data.originalTitle
        lblMoviewYear.text = data.releaseDate
        lblMoviewDesc.text = data.overview
        imageHelper.setImage(urlString: Constants.baseImgURL+data.posterPath, on: imgMoviewBanner)
    }
}

// MARK: - API Calling
extension MovieDetailsViewController {
    //MARK: - getting movies List with URLSession
    func getMovieDetails(movieId: Int) {
        viewModel.getMovieDetails(movieId: movieId) { movieDetail in
            self.setupData(data: movieDetail)
        } fail: { error in
            print(error.localizedDescription)
        }
    }
}
