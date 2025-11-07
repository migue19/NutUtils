//
//  UITableView.swift
//  RunSession
//
//  Created by Miguel Mexicano Herrera on 16/02/25.
//
import UIKit
extension UITableView {
    /// Register a cell that conforms the ReusableView protocol
    /// - Parameter _: Class of  the cell to be registered
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    /// Register a header of footer that conforms the ReusableView protocol
    /// - Parameter _: Class of the header of footer to be registered
    func register<T: UITableViewHeaderFooterView>(_: T.Type) where T: ReusableView {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    /// Dequeue a cell that conforms the ReusableView protocol
    /// - Parameter indexPath: indexPath of the cell
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    /// Dequeue a header or footer that conforms the ReusableView protocol
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T where T: ReusableView {
        guard let header = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue header of footer with identifier: \(T.reuseIdentifier)")
        }
        return header
    }
}
