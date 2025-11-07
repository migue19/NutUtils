//
//  UITextField.swift
//  RunSession
//
//  Created by Miguel Mexicano Herrera on 14/02/25.
//
import UIKit
extension UITextField {
    func setLeftPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }

    /// Adds padding to the right side. If there's an existing rightView (e.g. an eye button),
    /// it will be wrapped inside a container so the padding is preserved without removing the view.
    func setRightPadding(_ amount: CGFloat) {
        guard amount > 0 else {
            // If amount is zero, keep existing rightView as-is or remove it if it is a pure padding view
            if let rv = self.rightView, rv.subviews.count > 0 {
                // If it's a container we created before, try to unwrap the original view
                if rv.subviews.count == 2 {
                    // assume first is padding, second the original
                    let original = rv.subviews[1]
                    original.frame.origin.x = 0
                    self.rightView = original
                    self.rightViewMode = .always
                    return
                }
                // otherwise keep existing rightView
                self.rightViewMode = .always
                return
            }
            self.rightView = nil
            self.rightViewMode = .never
            return
        }

        if let existing = self.rightView {
            // Determine widths/heights
            let existingWidth = existing.frame.width > 0 ? existing.frame.width : existing.intrinsicContentSize.width
            let existingHeight = existing.frame.height > 0 ? existing.frame.height : existing.intrinsicContentSize.height
            let height = max(existingHeight, self.frame.height > 0 ? self.frame.height : 40)
            let container = UIView(frame: CGRect(x: 0, y: 0, width: amount + existingWidth, height: height))
            // padding view
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: height))
            paddingView.backgroundColor = .clear
            // position existing inside container
            existing.frame = CGRect(x: amount, y: (height - existingHeight)/2, width: existingWidth, height: existingHeight)
            container.addSubview(paddingView)
            container.addSubview(existing)
            self.rightView = container
            self.rightViewMode = .always
        } else {
            // No existing rightView: just set a padding view
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height > 0 ? self.frame.height : 40))
            paddingView.backgroundColor = .clear
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
}
