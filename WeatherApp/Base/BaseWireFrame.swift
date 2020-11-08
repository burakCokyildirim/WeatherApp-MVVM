//
//  BaseWireFrame.swift
//  WeatherApp
//
//  Created by Burak Çokyıldırım on 8.11.2020.
//

import UIKit

enum WireframeTransitionType {
    case root
    case present(fromViewController: UIViewController)
    case push(navigationController: UINavigationController, animated: Bool = true)
    case tabBar(tabBarController: UITabBarController, tabItem: UITabBarItem)
}

class BaseWireFrame {
    
    internal func changeView(transationType: WireframeTransitionType, viewController: UIViewController) {
        switch transationType {
        case .root:
            UIApplication.shared.windows.first?.rootViewController = viewController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        case .present(let fromViewController):
            fromViewController.present(viewController, animated: true, completion: nil)
        case .push(let navigationController, let animated):
            navigationController.pushViewController(viewController, animated: animated)
        case .tabBar(tabBarController: let tabBarController, tabItem: let tabItem):
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.tabBarItem = tabItem
            tabBarController.addChild(navigationController)
        }
    }
}
