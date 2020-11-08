//
//  NetworkConstants.swift
//  WeatherApp
//
//  Created by Burak Çokyıldırım on 7.11.2020.
//

import Foundation

struct NetworkConstants {
    static let baseUrl = "https://api.openweathermap.org/data/2.5/forecast"
    static let citiesCodeUrl = "https://weathercase-99549.firebaseio.com/.json"
    static let openWeatherApiKey = "0a4fd3e5878118143bbe5640784b79fc"
    static let contentType = ["Content-Type": "application/json"]
}
