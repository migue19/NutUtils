//
//  Collection.swift
//  NutUtils
//
//  Created by Miguel Mexicano Herrera on 05/10/26.
//

import Foundation

public extension Collection {
    /// Accede a un elemento de forma segura, regresando nil si el índice está fuera de rango.
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }

    /// Indica si la colección contiene al menos un elemento.
    var isNotEmpty: Bool {
        !isEmpty
    }
}
