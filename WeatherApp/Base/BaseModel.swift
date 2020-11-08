//
//  BaseModel.swift
//  WeatherApp
//
//  Created by Burak Çokyıldırım on 8.11.2020.
//

import Foundation
import SwiftyJSON

class BaseModel {
    
    init() {}
    required init(json _: JSON) {}

    func toJSON() -> JSON? {
        return nil
    }
    
    func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        let otherSelf = Mirror(reflecting: self)
        for child in otherSelf.children {
            if let key = child.label {
                dictionary[key] = child.value
            }
        }
        return dictionary
    }

    static func toModels<M: BaseModel>(json: JSON) -> [M] {
        return json.arrayValue.map({ M(json: $0) })
    }
}
