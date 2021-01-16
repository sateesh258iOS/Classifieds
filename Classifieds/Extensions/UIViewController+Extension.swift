//
//  UIViewController+Extension.swift
//  Classifieds
//
//  Created by Sateesh on 15/01/2021.
//

import UIKit

extension UIViewController {
    
     func showAlert(title: String?,
                     message: String?,
                     primaryButtonTitle: String = "Ok",
                     primaryButtonAction: (() -> Void)? = nil,
                     secondaryButtonTitle: String? = nil,
                     secondaryButtonAction: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            
            guard let topViewController = self.topViewController() else {
                return
            }
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let primaryAction = UIAlertAction(title: primaryButtonTitle, style: .default) { (_) in
                primaryButtonAction?()
            }
            if let secondaryTitle = secondaryButtonTitle {
                let secondaryAction = UIAlertAction(title: secondaryTitle, style: .default) { (_) in
                    secondaryButtonAction?()
                }
                alertController.addAction(secondaryAction)
            }
            alertController.addAction(primaryAction)
            topViewController.present(alertController, animated: true, completion: nil)
        }
    }
    
    func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}


