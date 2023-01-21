//
//  Extensions.swift
//  Movies Hub
//
//  Created by Shakeel on 1/20/23.
//

import UIKit

// MARK: - UITableViewCell Identifier
extension UITableViewCell {
    static var cellIdentifier: String {
        return String(describing: self)
    }
}

// MARK: - UITableView
extension UITableView {
    /// Generically deque cell for reusability
    func dequeueReusableCell<Cell: UITableViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withIdentifier: Cell.cellIdentifier, for: indexPath) as? Cell else {
            fatalError("Fatal error for reuseable cell at : \(indexPath)")
        }
        return cell
    }
}

// MARK: - Shadow & Radius
extension UIView {
    func cornerRadius(_ radius: CGFloat, borderWidth: CGFloat = 0.1) {
        layer.cornerRadius = radius
        layer.borderWidth = borderWidth
        layer.masksToBounds = true
    }
    
    func addBottomShadow(width: CGFloat) {
        layer.masksToBounds = false
        layer.shadowRadius = 4
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowPath = UIBezierPath(rect: CGRect(x: bounds.minX,
                                                     y: bounds.maxY - layer.shadowRadius,
                                                     width: width,
                                                     height: layer.shadowRadius)).cgPath
    }
}

// MARK: - Loader
struct LoadingIndicator {
    static func show(in viewController: UIViewController) {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        alert.view.tintColor = UIColor.black
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating()

        alert.view.addSubview(loadingIndicator)
        viewController.present(alert, animated: true, completion: nil)
    }

    static func hide(in viewController: UIViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
}

