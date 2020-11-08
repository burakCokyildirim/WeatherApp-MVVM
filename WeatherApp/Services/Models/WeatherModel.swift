//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Burak Çokyıldırım on 8.11.2020.
//

import Foundation
import SwiftyJSON

class WeatherModel: BaseModel {

    var date: Date!
    var main: MainWeatherModel!
    var weatherType: WeatherType!
    var detail: String!
    var windSpeed: Int!
    var visibility: Int!

    
    required init(json: JSON) {
        super.init(json: json)

        date = Date(timeIntervalSince1970: json["dt"].doubleValue)
        
        main = MainWeatherModel(json: json["main"])
        
        if let weatherType = json["weather"].array?.first?["main"].string {
            self.weatherType = WeatherType(rawValue: weatherType)
        } else {
            self.weatherType = WeatherType.rain
        }
        
        if let detail = json["weather"].array?.first?["description"].string {
            self.detail = detail
        } else {
            detail = ""
        }
        
        windSpeed = json["wind"]["speed"].intValue
        visibility = json["visibility"].intValue
    }
}
