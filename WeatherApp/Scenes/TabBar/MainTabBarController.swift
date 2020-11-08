//
//  MainTabBarController.swift
//  WeatherApp
//
//  Created by Burak Çokyıldırım on 8.11.2020.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        initTabBar()
    }
    
    func initTabBar() {
        
        let citiesItem = UITabBarItem(title: "cities_title".localized, image: #imageLiteral(resourceName: "citiesTabBarIcon"), selectedImage: nil)
        let homeItem = UITabBarItem(title: "home_tab_title".localized, image: #imageLiteral(resourceName: "homeTabBarIcon"), selectedImage: nil)
        
        
        HomeWireFrame().show(transitionType: .tabBar(tabBarController: self, tabItem: homeItem))
        CitiesWireFrame().show(transitionType: .tabBar(tabBarController: self, tabItem: citiesItem))
        
    }
}
