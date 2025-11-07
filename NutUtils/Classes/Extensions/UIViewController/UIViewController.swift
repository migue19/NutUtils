//
//  UIViewController.swift
//  NutUtils
//
//  Created by Miguel Mexicano Herrera on 23/08/23.
//

import UIKit
public

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
//import UIKit
//extension UIViewController {
//    func setupDismissKeyboardGesture() {
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
//        tapGesture.cancelsTouchesInView = false
//        view.addGestureRecognizer(tapGesture)
//    }
//    func presentInKeyWindow(animated: Bool = true, completion: (() -> Void)? = nil) {
//        DispatchQueue.main.async {
//            UIApplication.shared.keyWindow?.rootViewController?
//                .present(self, animated: animated, completion: completion)
//        }
//    }
//
//    func presentInKeyWindowPresentedController(animated: Bool = true, completion: (() -> Void)? = nil) {
//        DispatchQueue.main.async {
//            UIApplication.shared.keyWindowPresentedController?
//                .present(self, animated: animated, completion: completion)
//        }
//    }
//}
//@objc extension UIViewController{
//
//    /// Returns the most recently presented UIViewController (visible).
//    @objc public func findLastPresentedViewController() -> UIViewController? {
//        func findTopLevelViewController(_ viewController: UIViewController) -> UIViewController? {
//            if let vc = viewController.presentedViewController {
//                return findTopLevelViewController(vc)
//            } else if let vc = viewController as? UISplitViewController  {
//                if let vc = vc.viewControllers.last {
//                    return findTopLevelViewController(vc)
//                }
//                return vc
//            } else if let vc = viewController as? UINavigationController {
//                if let vc = vc.topViewController {
//                    return findTopLevelViewController(vc)
//                }
//                return vc
//            } else if let vc = viewController as? UITabBarController {
//                if let vc = vc.selectedViewController {
//                    return findTopLevelViewController(vc)
//                }
//                return vc
//            } else {
//                return viewController
//            }
//        }
//
//        if let rootViewController = UIApplication.shared.keyWindow?.rootViewController {
//            return findTopLevelViewController(rootViewController)
//        }
//
//        return nil
//    }
//
//
//    public func show(_ viewController: UIViewController) {
//        navigationController?.show(viewController, sender: self)
//    }
//
//    public func backToPrevious(animated: Bool = true) {
//        if let presentingViewController = presentingViewController {
//            presentingViewController.dismiss(animated: animated, completion: nil)
//        } else {
//            _ = navigationController?.popViewController(animated: animated)
//        }
//    }
//
//    public func backToRoot(animated: Bool = true) {
//        if let presentingViewController = presentingViewController {
//            presentingViewController.dismiss(animated: animated, completion: nil)
//        } else {
//            _ = navigationController?.popToRootViewController(animated: animated)
//        }
//    }
//
//    public func present(_ viewControllerToPresent: UIViewController, completion: @escaping (() -> ())) {
//        present(viewControllerToPresent, animated: true, completion: completion)
//    }
//
//    public func present(_ viewControllerToPresent: UIViewController) {
//        present(viewControllerToPresent, animated: true, completion: nil)
//    }
//
//    public func dismiss(completion: (() -> Void)? = nil) {
//        presentingViewController?.dismiss(animated: true, completion: completion)
//    }
//
//    public func dismissToTop(animated: Bool = true, completion: (() -> Void)? = nil) {
//        var presentedViewController = self
//        while let presentingViewController = presentedViewController.presentingViewController {
//            presentedViewController = presentingViewController
//        }
//        presentedViewController.dismiss(animated: animated, completion: completion)
//    }
//
//
//    public func addChild(asChildViewController viewController: UIViewController, diseredView : UIView) {
//        // Add Child View Controller
//        addChild(viewController)
//
//        // Add Child View as Subview
//        diseredView.addSubview(viewController.view)
//
//        // Configure Child View
//        viewController.view.frame = diseredView.bounds
//        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        // Notify Child View Controller
//        viewController.didMove(toParent: self)
//    }
//
//
//    private func removeChild(asChildViewController viewController: UIViewController) {
//        // Notify Child View Controller
//        viewController.willMove(toParent: nil)
//
//        // Remove Child View From Superview
//        viewController.view.removeFromSuperview()
//
//        // Notify Child View Controller
//        viewController.removeFromParent()
//    }
//
//}
