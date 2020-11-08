//
//  Enums.swift
//  WeatherApp
//
//  Created by Burak Çokyıldırım on 7.11.2020.
//

import Foundation

enum PopupCloseType {
    case close
    case done
    case yes
    case no
}

enum WeatherType: String {
    case rain = "Rain"
    case clouds = "Clouds"
    case snow = "Snow"
    case extreme = "Extreme"
    case clear = "Clear"
}
