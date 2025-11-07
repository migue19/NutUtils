//
//  UIView.swift
//  NutUtils
//
//  Created by Miguel Mexicano Herrera on 30/07/21.
//
import UIKit
public extension UIView {
    func elevate(elevation: Double, shadowColor: CGColor = UIColor.black.cgColor) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor
        self.layer.shadowOffset = CGSize(width: 0, height: elevation)
        self.layer.shadowRadius = CGFloat(elevation)
        self.layer.shadowOpacity = 0.5
    }
    /// Función para añadir vistas a la vista padre
    /// - Parameter views: vistas a agregar
    func addSubviews(_ views: UIView...) {
        views.forEach({ self.addSubview($0) })
    }
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
public protocol ReusableView: AnyObject {
    /// Represents the reusesable identifier for a cell
    static var reuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    /// Set the reuse identifier to be equal to the class name
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
