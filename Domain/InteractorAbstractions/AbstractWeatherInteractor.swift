//
//  AbstractWeatherInteractor.swift
//  Domain
//
//  Created by vasanth on 5/8/19.
//  Copyright © 2019 vasanth. All rights reserved.
//

import Foundation


public protocol  AbstractWeatherInteractor:WeatherUsecase{
    var worker:WeatherUsecase?{get set}
}
