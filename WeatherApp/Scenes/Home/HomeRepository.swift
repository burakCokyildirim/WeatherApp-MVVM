//
//  HomeRepository.swift
//  WeatherApp
//
//  Created by Burak Çokyıldırım on 8.11.2020.
//

import Foundation

class HomeRepository: BaseRepository {
    
    func fetchData(success: @escaping ([WeatherModel])->(), failure: @escaping(String)->()) {
        
    
        let url = "\(NetworkConstants.baseUrl)?id=745042&appid=\(NetworkConstants.openWeatherApiKey)"
        networkService.request(url, method: .post, headers: NetworkConstants.contentType) { (json) in
            
            var weathers: [WeatherModel] = []
            
            for weather in json["list"].arrayValue {
                weathers.append(WeatherModel(json: weather))
            }
            
            success(weathers)
        } failure: { (message, code) in
            failure(message)
        }
    }
}
