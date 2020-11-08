//
//  StringExtensions.swift
//  WeatherApp
//
//  Created by Burak Çokyıldırım on 7.11.2020.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
