//
//  UIColor.swift
//  NutUtils
//
//  Created by Miguel Mexicano Herrera on 05/10/26.
//

import UIKit

public extension UIColor {
    /// Crea un color a partir de un string hexadecimal ("#RRGGBB", "RRGGBB", "#RRGGBBAA" o "RRGGBBAA").
    convenience init?(hex: String) {
        let hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "#", with: "")

        guard hexString.count == 6 || hexString.count == 8 else { return nil }

        var hexValue: UInt64 = 0
        guard Scanner(string: hexString).scanHexInt64(&hexValue) else { return nil }

        let red: CGFloat
        let green: CGFloat
        let blue: CGFloat
        let alpha: CGFloat
        if hexString.count == 8 {
            red = CGFloat((hexValue & 0xFF00_0000) >> 24) / 255
            green = CGFloat((hexValue & 0x00FF_0000) >> 16) / 255
            blue = CGFloat((hexValue & 0x0000_FF00) >> 8) / 255
            alpha = CGFloat(hexValue & 0x0000_00FF) / 255
        } else {
            red = CGFloat((hexValue & 0xFF0000) >> 16) / 255
            green = CGFloat((hexValue & 0x00FF00) >> 8) / 255
            blue = CGFloat(hexValue & 0x0000FF) / 255
            alpha = 1
        }

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
