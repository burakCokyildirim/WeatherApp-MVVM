//
//  CitiesViewController.swift
//  WeatherApp
//
//  Created by Burak Çokyıldırım on 7.11.2020.
//

import UIKit

class CitiesViewController: BaseViewController<CitiesViewModel> {
    
    // MARK: - LifeCycle
    
    override func initView() {
        super.initView()
        
        self.barTitle = "cities_title".localized
    }
    
    override func initVM() {
        super.initVM()
        
    }
}
