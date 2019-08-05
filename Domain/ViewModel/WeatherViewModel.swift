//
//  WeatherViewModel.swift
//  Domain
//
//  Created by vasanth on 5/8/19.
//  Copyright © 2019 vasanth. All rights reserved.
//

import Foundation

public struct WeatherViewModel {
    

    public var city: String?
    public var iconUrl: String?
    public var description: String?
    public var observationTime: String?
    public var humidity : String?
    public var temp: String?
    public init(city: String? = nil,
                iconUrl: String? = nil,
                description: String? = nil,
                observationTime: String? = nil,
                humidity : String? = nil,
                temp: String? = nil) {
        self.city                 = city
        self.iconUrl             = iconUrl
        self.description         = description
        self.observationTime     = observationTime
        self.humidity             = humidity
        self.temp                 = temp
    }
//
//    private let weatherList: CurrentCondition
//
//
//    var city: String {
//        return weatherList.weatherIconURL.first?.value ?? "_"
//    }
//    var iconUrl: String {
//        return weatherList.weatherIconURL.first?.value ?? "_"
//    }
//    var description: String {
//        return (weatherList.weatherDesc.first?.value) ?? "_"
//    }
//
//    var observationTime: String {
//        return (weatherList.observationTime)
//    }
//
//    var humidity : String {
//        return String(format: "%d %", weatherList.humidity)
//    }
//
//
//    var temp: String {
//        return String(format: "%d°C", weatherList.tempC)
//    }
    
}
