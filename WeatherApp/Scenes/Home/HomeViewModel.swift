//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Burak Çokyıldırım on 7.11.2020.
//

import Foundation

class HomeViewModel: BaseViewModel {
    
    var repository: HomeRepository!
    
    var weathers: [WeatherModel] = [] {
        didSet {
            self.fetchData?(weathers)
        }
    }
    
    var message: String = "" {
        didSet {
            self.showError?(message)
        }
    }
    
    var showError: ((String)->())?
    
    var fetchData: (([WeatherModel])->())?
    
    func initFetch() {
        
        isLoading = true
        
        repository.fetchData { (weathers) in
            
            self.isLoading = false
            self.weathers = weathers
            
        } failure: { (message) in
            
            self.isLoading = false
            self.message = message
        }

    }
}
