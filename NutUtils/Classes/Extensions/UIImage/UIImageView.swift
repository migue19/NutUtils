//
//  UIImageView.swift
//  NutUtils
//
//  Created by Miguel Mexicano Herrera on 30/07/21.
//

import Foundation
import UIKit

public class ImageLoader: UIImageView {
    // MARK: - Constants
    let imageCache = NSCache<NSString, AnyObject>()
    // MARK: - Properties
    var imageURLString: String?
    let activityIndicator = UIActivityIndicatorView()
    public func downloadImageFrom(urlString: String, imageMode: UIView.ContentMode) {
        guard let url = URL(string: urlString) else { return }
        downloadImageFrom(url: url, imageMode: imageMode)
    }
    public func downloadImageFrom(url: URL, imageMode: UIView.ContentMode) {
        setupActivityIndicator()
        activityIndicator.startAnimating()
        contentMode = imageMode
        imageURLString = url.absoluteString
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) as? UIImage {
            self.image = cachedImage
            activityIndicator.stopAnimating()
        } else {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let self = self else { return }
                guard let data = data, error == nil, let imageToCache = UIImage(data: data) else {
                    DispatchQueue.main.async {
                        self.activityIndicator.stopAnimating()
                    }
                    return
                }
                self.imageCache.setObject(imageToCache, forKey: url.absoluteString as NSString)
                DispatchQueue.main.async {
                    // Avoid showing a stale image if the view was reused for another URL while this request was in flight.
                    guard self.imageURLString == url.absoluteString else { return }
                    self.image = imageToCache
                    self.activityIndicator.stopAnimating()
                }
            }.resume()
        }
    }
    private func setupActivityIndicator() {
        activityIndicator.color = .darkGray
        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
