//
//  EntityClass.swift
//  WeatherApp
//
//  Created by vasanth on 5/8/19.
//  Copyright © 2019 vasanth. All rights reserved.
//

import Foundation

public struct  ResponseData {
    
    public var weather: WeatherEntity?
    public var city: String?
}
public struct  WeatherEntity {
    
    public var temp_C : String?
    public  var temp_F : String?
    public var humidity : String?
    public var desc : [String]?
    public var date : String?
    public var day : String?
    public var imgUrl : [String]?
    public var observationTime : String?
}

public struct City {
    public var name: String?
    public init(name:String?) {
        self.name = name
    }
}
