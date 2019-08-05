//
//  ApiManager.swift
//  WeatherApp
//
//  Created by vasanth on 5/8/19.
//  Copyright © 2019 vasanth. All rights reserved.
//

import Foundation
import Domain
//"http://api.openweathermap.org/data/2.5/forecast?q=Singapore&APPID=400db7622e647612468e9fe1c4b5aaf8")

//http://api.openweathermap.org/data/2.5/weather?q=Singapore&appid=400db7622e647612468e9fe1c4b5aaf8


//http://api.worldweatheronline.com/premium/v1/weather.ashx?key=13e3c864e295419ba42115515193107&q=Singapore&format=json&num_of_days=1

enum Router {
    
    case Weather(city:City)
    
    var scheme: String {
        switch self {
        case  .Weather:
            return "http"
        }
    }
    
    var host: String {
        switch self {
        case  .Weather:
            return "api.worldweatheronline.com"
        }
    }
    
    var path: String {
        switch self {
        case .Weather:
            
            return "/premium/v1/weather.ashx"
        }
    }
    
    var parameters: [URLQueryItem] {
        let accessToken = "13e3c864e295419ba42115515193107"
        switch self {
        case let .Weather(city):
            return [URLQueryItem(name: "q", value:city.name),
                    URLQueryItem(name: "key", value: accessToken),
                    URLQueryItem(name: "format", value: "json"),
                    URLQueryItem(name: "num_of_days", value: "1")]
        }
    }
    
    var method: String {
        switch self {
        case .Weather:
            return "GET"
        }
    }
}

class APIServiceLayer {
    
    static func request(router: Router, completion: @escaping (Result<[CurrentCondition], Error>) -> Void) {
        
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.parameters
        
        guard let url = components.url else { return }
        
        guard let fileUrl = Bundle.main.url(forResource: "weather", withExtension: "json") else {return}
        
        // var urlRequest = URLRequest(url: url)
        var urlRequest = URLRequest(url: fileUrl)
        urlRequest.httpMethod = router.method
        
        let session = URLSession(configuration: .default)
        
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                completion(.failure(error!))
                print(error?.localizedDescription as Any)
                return
            }
            
            guard response != nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            let list = try? JSONDecoder().decode(Weather.self, from: data)
            DispatchQueue.main.async {
                completion(Result.success(list?.data.currentCondition ?? []))
            }
        }
        dataTask.resume()
    }
}
