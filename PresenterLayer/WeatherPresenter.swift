//
//  WeatherInteractor.swift
//  WeatherApp
//
//  Created by vasanth on 5/8/19.
//  Copyright © 2019 vasanth. All rights reserved.
//

import Foundation
import Domain
public class WeatherPresenter:AbstractWeatherPresenter{
    public init(){
        
    }
    public func presentWeather(with result:(Result<[CurrentCondition], Error>),and city:City) -> WeatherViewModel? {

        
        let transformer:(([CurrentCondition]) -> WeatherViewModel) = {
            let currentCondition:CurrentCondition? = $0.first
            return WeatherViewModel(city: city.name, iconUrl: currentCondition?.weatherIconURL.first?.value, description: currentCondition?.weatherDesc.first?.value, observationTime: String(format: "Last Updated Time:  %@",currentCondition?.observationTime ?? "-"), humidity: String(format: "Humidity: %@ %%", currentCondition?.humidity ?? ""), temp: String(format: "%@°C", currentCondition?.tempC ?? ""), tempF: String(format: "Temp: %@°F", currentCondition?.tempF ?? ""))
            
        }
        switch result {
        case .success(let condtions):
            return transformer(condtions)
        default:
            return nil
        }
    }
    
    
}
