//
//  String.swift
//  NutUtils
//
//  Created by Miguel Mexicano Herrera on 23/08/23.
//
import UIKit
import Foundation
public extension String {
    /// Función que encapsula la llamada al archivo strings del proyecto.
    ///     - Returns: Regresa el texto correcto del archivo strings o el mismo.
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    var toInt: Int? {
        return Int(self)
    }
    func bold(substring: String, normalFont: UIFont, boldFont: UIFont) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(
            string: self,
            attributes: [.font: normalFont]
        )
        let range = (self as NSString).range(of: substring)
        if range.location != NSNotFound {
            attributedString.addAttributes([.font: boldFont], range: range)
        }
        return attributedString
    }
    func toDate(dateFormat: String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale(identifier: "es_MX")
        return formatter.date(from: self)
    }
    func toDoubleCurrency() -> Double? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "es_MX")
        return formatter.number(from: self)?.doubleValue
    }
    var toDouble: Double? {
        return Double(self)
    }
    func secret(character: String) -> String {
        var string: String = ""
        self.forEach { c in
            string.append(character)
        }
        return string
    }
}
extension StringProtocol {
    var firstUppercased: String { return prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { return prefix(1).capitalized + dropFirst() }
}
