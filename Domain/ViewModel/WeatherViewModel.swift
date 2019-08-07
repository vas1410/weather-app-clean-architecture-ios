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
    public var tempF: String?
    public init(city: String? = nil,
                iconUrl: String? = nil,
                description: String? = nil,
                observationTime: String? = nil,
                humidity : String? = nil,
                temp: String? = nil,
                tempF: String? = nil) {
        self.city                 = city
        self.iconUrl             = iconUrl
        self.description         = description
        self.observationTime     = observationTime
        self.humidity             = humidity
        self.temp                 = temp
        self.tempF                = tempF
    }

    
}
