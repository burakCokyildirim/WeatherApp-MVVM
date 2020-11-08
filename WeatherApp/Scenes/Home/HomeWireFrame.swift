//
//  HomeWireFrame.swift
//  WeatherApp
//
//  Created by Burak Çokyıldırım on 8.11.2020.
//

import UIKit

class HomeWireFrame: BaseWireFrame {
    
    func show(transitionType: WireframeTransitionType) {
        
        let viewController: HomeViewController = UIStoryboard.Main.instantiateViewController()
        
        let viewModel = HomeViewModel()
        
        let repository = HomeRepository()
        
        viewModel.repository = repository
        viewController.viewModel = viewModel
        
        changeView(transationType: transitionType, viewController: viewController)
    }
}
