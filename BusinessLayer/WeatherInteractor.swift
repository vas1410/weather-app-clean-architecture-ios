//
//  WeatherInteractor.swift
//  WeatherApp
//
//  Created by vasanth on 5/8/19.
//  Copyright © 2019 vasanth. All rights reserved.
//

import Foundation
import Domain

public class WeatherInteractor:AbstractWeatherInteractor{
    public var worker: WeatherUsecase?
    public init(worker: WeatherUsecase) {
        self.worker = worker
    }
    public func fetchWeather(on day: WeatherDay, for city: City, completion: @escaping ((Result<[CurrentCondition], Error>) -> Void)) {
        worker?.fetchWeather(on: day, for: city, completion: completion)
    }
    
    
}
