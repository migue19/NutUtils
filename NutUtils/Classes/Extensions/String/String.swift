//
//  String.swift
//  NutUtils
//
//  Created by Miguel Mexicano Herrera on 23/08/23.
//

import Foundation
public extension String {
    func toDate(dateFormat: String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale(identifier: "es_MX")
        return formatter.date(from: self)
    }
    func toDouble() -> Double? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "es_MX")
        return formatter.number(from: self)?.doubleValue
    }
}
