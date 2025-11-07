//
//  UILabel.swift
//  RunSession
//
//  Created by Miguel Mexicano Herrera on 24/03/25.
//
import UIKit
extension UILabel {
    func roundCorners(corners: CACornerMask, radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = corners
        self.layer.masksToBounds = true
    }
}
