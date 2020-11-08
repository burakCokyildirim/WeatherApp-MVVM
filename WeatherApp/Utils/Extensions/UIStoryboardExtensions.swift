//
//  UIStoryboardExtensions.swift
//  WeatherApp
//
//  Created by Burak Çokyıldırım on 8.11.2020.
//

import UIKit

extension UIStoryboard {
    
    static var Main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    func instantiateViewController<VC: UIViewController>() -> VC {
        guard let viewController = self.instantiateViewController(withIdentifier: VC.className) as? VC
        else { fatalError("could not instantiateViewController with identifier \(VC.className)") }
        return viewController
    }
}

extension NSObject {
    
    class var className: String {
        return String(describing: self)
    }
}
