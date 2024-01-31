//
//  UIImage.swift
//  NutUtils
//
//  Created by Miguel Mexicano Herrera on 31/01/24.
//

import UIKit
public extension UIImage {
    var grayed: UIImage {
        guard let ciImage = CIImage(image: self)
            else { return self }
        let filterParameters = [ kCIInputColorKey: CIColor.white, kCIInputIntensityKey: 1.0 ] as [String: Any]
        let grayscale = ciImage.applyingFilter("CIColorMonochrome", parameters: filterParameters)
        return UIImage(ciImage: grayscale)
    }
    var grayedColor: (CIColor) -> UIImage {
        {
            guard let ciImage = CIImage(image: self) else { return self }
            let filterParameters = [ kCIInputColorKey: $0, kCIInputIntensityKey: 1.0 ] as [String: Any]
            let grayscale = ciImage.applyingFilter("CIColorMonochrome", parameters: filterParameters)
            return UIImage(ciImage: grayscale)
        }
    }
}
