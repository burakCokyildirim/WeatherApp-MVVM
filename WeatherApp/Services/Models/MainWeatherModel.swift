//
//  MainWeatherModel.swift
//  WeatherApp
//
//  Created by Burak Çokyıldırım on 8.11.2020.
//

import Foundation
import SwiftyJSON

class MainWeatherModel: BaseModel {
    
    var temp: Float!
    var minTemp: Float!
    var maxTemp: Float!
    var huminity: Int!
    
    
    required init(json: JSON) {
        super.init(json: json)
        
        temp = json["temp"].floatValue
        minTemp = json["temp_min"].floatValue
        maxTemp = json["temp_max"].floatValue
        huminity = json["humidity"].intValue
        
    }
}
