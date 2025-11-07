//
//  UIBezierPath.swift
//  RunSession
//
//  Created by Miguel Mexicano Herrera on 19/08/25.
//
import UIKit
// Helper para rellenar con color (evita setFill global)
extension UIBezierPath {
    func fill(with blend: CGBlendMode, alpha: CGFloat, color: UIColor) {
        color.setFill()
        self.fill(with: blend, alpha: alpha)
    }
}
