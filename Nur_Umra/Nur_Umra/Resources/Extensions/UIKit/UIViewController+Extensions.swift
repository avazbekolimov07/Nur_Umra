//
//  UIViewController+Extensions.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 21/02/23.
//

import UIKit

extension UIViewController {

    func safePresent(_ viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
        let viewController = topViewController()

        guard viewController as? UIAlertController == nil else { return }
        DispatchQueue.main.async {
            viewController.present(viewControllerToPresent, animated: animated, completion: completion)
        }
    }

    func safeDismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        guard let alreadyPresentedViewController = presentedViewController else {
            DispatchQueue.main.async {
                self.dismiss(animated: flag, completion: completion)
            }
            return
        }
        alreadyPresentedViewController.safeDismiss(animated: flag, completion: completion)
    }

    func topViewController() -> UIViewController {

        if let presentedViewController = presentedViewController {
            return presentedViewController.topViewController()
        }

        if let navigationController = self as? UINavigationController {
            return navigationController.visibleViewController?.topViewController() ?? navigationController
        }

        if let tabBarController = self as? UITabBarController {
            return tabBarController.selectedViewController?.topViewController() ?? tabBarController
        }

        return self
    }

}
