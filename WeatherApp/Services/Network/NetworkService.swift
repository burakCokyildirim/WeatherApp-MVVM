//
//  NetworkService.swift
//  WeatherApp
//
//  Created by Burak Çokyıldırım on 7.11.2020.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkService {
    
    static let sharedInstance = NetworkService()
    
    var manager: SessionManager!
    
    func request(_ url: String, method: HTTPMethod, parameters: Parameters? = nil, encoding: ParameterEncoding = JSONEncoding.default, headers: HTTPHeaders, completion: @escaping (_ response: JSON) ->(), failure: @escaping (_ error: String, _ errorCode: Int) -> ()) {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        
        manager = Alamofire.SessionManager(configuration: configuration)
        
        
        DispatchQueue.global().async {
            self.manager.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseString(queue: DispatchQueue.main, encoding: String.Encoding.utf8) { response in
                        
                print("\n\n-- RESPONSE: \(response)")
                
                if response.response?.statusCode == 200 {
                    guard let callback = response.data else {
                        failure(self.generateErrorMessage(), 0)
                        return
                    }
                    let json = JSON(callback)
                    if json["cod"].intValue == 200 {
                        completion(json)
                    } else {
                        failure(self.generateErrorMessage(), 0)
                    }
                    
                } else {
                    failure(self.generateErrorMessage(), 0)
                }
            }
        }
    }
        
    func generateErrorMessage() -> String {
        return "error_message.somethings_wrong".localized
    }

}
