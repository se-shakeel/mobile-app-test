//
//  ImageHelper.swift
//  movies-hub
//
//  Created by Shakeel on 1/21/23.
//

import UIKit
import SDWebImage

class ImageHelper {
    func setImage(urlString: String, on imageView: UIImageView) {
        if verifyUrl(urlString: urlString) {
            imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            imageView.sd_setImage(with: URL(string: urlString))
        } else {
            imageView.image = UIImage(systemName: "exclamationmark.triangle")
        }
    }
    
    func verifyUrl(urlString: String?) -> Bool {
        if let urlString = urlString, let url = URL(string: urlString) {
            return UIApplication.shared.canOpenURL(url)
        }
        return false
    }
}
