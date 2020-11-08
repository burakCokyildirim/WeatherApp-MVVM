//
//  UIViewControllerExtensions.swift
//  WeatherApp
//
//  Created by Burak Çokyıldırım on 7.11.2020.
//

import UIKit

typealias PopupCompletionHandler = (_ closeType: PopupCloseType) -> Void

extension UIViewController {
    func showPopup(title: String, message: String, completionHandler: PopupCompletionHandler?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "ok".localized, style: .default, handler: { (action) in
            completionHandler?(.done)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showPopupYesNo(title: String, message: String, completionHandler: PopupCompletionHandler?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "yes".localized, style: .default, handler: { (action) in
            completionHandler?(.yes)
        }))
        
        alert.addAction(UIAlertAction(title: "no".localized, style: .cancel, handler: { (action) in
            completionHandler?(.no)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func changeView(transationType: TransitionType, viewController: UIViewController) {
        switch transationType {
        case .root:
            UIApplication.shared.windows.first?.rootViewController = viewController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        case .present(let fromViewController):
            fromViewController.present(viewController, animated: true, completion: nil)
        case .push(let navigationController, let animated):
            navigationController.pushViewController(viewController, animated: animated)
        }
    }
}

enum TransitionType {
    case root
    case present(fromViewController: UIViewController)
    case push(navigationController: UINavigationController, animated: Bool = true)
}
