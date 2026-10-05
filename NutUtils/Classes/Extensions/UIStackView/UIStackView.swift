//
//  UIStackView.swift
//  NutUtils
//
//  Created by Miguel Mexicano Herrera on 05/10/26.
//

import UIKit

public extension UIStackView {
    /// Remueve todas las vistas del stack, tanto de arrangedSubviews como de la jerarquía de subviews.
    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach {
            removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
}
