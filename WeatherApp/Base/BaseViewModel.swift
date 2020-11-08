//
//  BaseViewModel.swift
//  WeatherApp
//
//  Created by Burak Çokyıldırım on 7.11.2020.
//

import Foundation

class BaseViewModel {
    
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    
    var updateLoadingStatus: (()->())?
    
    required public init() {
        
    }
}
