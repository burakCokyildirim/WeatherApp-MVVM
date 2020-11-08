//
//  CitiesWireFrame.swift
//  WeatherApp
//
//  Created by Burak Çokyıldırım on 8.11.2020.
//

import UIKit

class CitiesWireFrame: BaseWireFrame {
    
    func show(transitionType: WireframeTransitionType) {
        
        let viewController: CitiesViewController = UIStoryboard.Main.instantiateViewController()
        
        let viewModel = CitiesViewModel()
    
        viewController.viewModel = viewModel
        
        changeView(transationType: transitionType, viewController: viewController)
    }
}
