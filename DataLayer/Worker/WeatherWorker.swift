//
//  WeatherWorker.swift
//  WeatherApp
//
//  Created by vasanth on 5/8/19.
//  Copyright © 2019 vasanth. All rights reserved.
//

import Foundation
import Domain

public class WeatherWorker: WeatherUsecase {
    public init(){
        
    }
        //dependency
    public func fetchWeather(on day: WeatherDay, for city: City, completion: @escaping ((Result<[CurrentCondition], Error>) -> Void)) {
        let router = Router.Weather(city: city)
        APIServiceLayer.request(router: router, completion:completion)
    }
  
}
