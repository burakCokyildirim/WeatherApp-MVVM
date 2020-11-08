//
//  SplashViewController.swift
//  WeatherApp
//
//  Created by Burak Çokyıldırım on 8.11.2020.
//

import UIKit

class SplashViewController: BaseViewController<SplashViewModel> {
    
    override func initVM() {
        super.initVM()
        
    }
    
    override func initView() {
        super.initView()
        
        let mainTabBarViewController: MainTabBarController = UIStoryboard.Main.instantiateViewController()
        
        changeView(transationType: .root, viewController: mainTabBarViewController)
    }
}
