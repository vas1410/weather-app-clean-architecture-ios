//
//  Usecase.swift
//  WeatherApp
//
//  Created by vasanth on 5/8/19.
//  Copyright © 2019 vasanth. All rights reserved.
//

import Foundation


//Fetch Weather
//Fetch City
public enum WeatherDay{
    case today
    case date(Date)
}

public protocol WeatherUsecase{
    func fetchWeather(on day: WeatherDay, for city: City, completion:  @escaping  ((Result<[CurrentCondition], Error>) -> Void))
}
