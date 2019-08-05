//
//  Weather.swift
//  WeatherApp
//
//  Created by vasanth on 5/8/19.
//  Copyright © 2019 vasanth. All rights reserved.
//

import Foundation

// MARK: - Weather
public struct Weather: Codable {
    public let data: DataClass
}

// MARK: - DataClass
public struct DataClass: Codable {
    public let request: [Request]
    public let currentCondition: [CurrentCondition]
    public let weather: [WeatherElement]
    public let climateAverages: [ClimateAverage]
    
    enum CodingKeys: String, CodingKey {
        case request
        case currentCondition = "current_condition"
        case weather
        case climateAverages = "ClimateAverages"
    }
}

// MARK: - ClimateAverage
public struct ClimateAverage: Codable {
    public let month: [Month]
}

// MARK: - Month
public struct Month: Codable {
    public let index, name, avgMinTemp, avgMinTempF: String
    public let absMaxTemp, absMaxTempF, avgDailyRainfall: String
    
    enum CodingKeys: String, CodingKey {
        case index, name, avgMinTemp
        case avgMinTempF = "avgMinTemp_F"
        case absMaxTemp
        case absMaxTempF = "absMaxTemp_F"
        case avgDailyRainfall
    }
}

// MARK: - CurrentCondition
public struct CurrentCondition: Codable {
    public let observationTime, tempC, tempF, weatherCode: String
    public let weatherIconURL, weatherDesc: [WeatherDescElement]
    public let windspeedMiles, windspeedKmph, winddirDegree, winddir16Point: String
    public let precipMM, precipInches, humidity, visibility: String
    public let visibilityMiles, pressure, pressureInches, cloudcover: String
    public let feelsLikeC, feelsLikeF: String
    public let uvIndex: Int
    
    enum CodingKeys: String, CodingKey {
        case observationTime = "observation_time"
        case tempC = "temp_C"
        case tempF = "temp_F"
        case weatherCode
        case weatherIconURL = "weatherIconUrl"
        case weatherDesc, windspeedMiles, windspeedKmph, winddirDegree, winddir16Point, precipMM, precipInches, humidity, visibility, visibilityMiles, pressure, pressureInches, cloudcover
        case feelsLikeC = "FeelsLikeC"
        case feelsLikeF = "FeelsLikeF"
        case uvIndex
    }
}

// MARK: - WeatherDescElement
public struct WeatherDescElement: Codable {
    public let value: String
}

// MARK: - Request
public  struct Request: Codable {
    public let type, query: String
}

// MARK: - WeatherElement
public  struct WeatherElement: Codable {
    public let date: String
    public let astronomy: [Astronomy]
    public let maxtempC, maxtempF, mintempC, mintempF: String
    public let avgtempC, avgtempF, totalSnowCM, sunHour: String
    public let uvIndex: String
    public let hourly: [Hourly]
    
    enum CodingKeys: String, CodingKey {
        case date, astronomy, maxtempC, maxtempF, mintempC, mintempF, avgtempC, avgtempF
        case totalSnowCM = "totalSnow_cm"
        case sunHour, uvIndex, hourly
    }
}

// MARK: - Astronomy
public struct Astronomy: Codable {
    public let sunrise, sunset, moonrise, moonset: String
    public let moonPhase, moonIllumination: String
    
    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
    }
}

// MARK: - Hourly
public struct Hourly: Codable {
    public let time, tempC, tempF, windspeedMiles: String
    public let windspeedKmph, winddirDegree, winddir16Point, weatherCode: String
    public let weatherIconURL, weatherDesc: [WeatherDescElement]
    public let precipMM, precipInches, humidity, visibility: String
    public let visibilityMiles, pressure, pressureInches, cloudcover: String
    public let heatIndexC, heatIndexF, dewPointC, dewPointF: String
    public let windChillC, windChillF, windGustMiles, windGustKmph: String
    public let feelsLikeC, feelsLikeF, chanceofrain, chanceofremdry: String
    public let chanceofwindy, chanceofovercast, chanceofsunshine, chanceoffrost: String
    public let chanceofhightemp, chanceoffog, chanceofsnow, chanceofthunder: String
    public let uvIndex: String
    
    enum CodingKeys: String, CodingKey {
        case time, tempC, tempF, windspeedMiles, windspeedKmph, winddirDegree, winddir16Point, weatherCode
        case weatherIconURL = "weatherIconUrl"
        case weatherDesc, precipMM, precipInches, humidity, visibility, visibilityMiles, pressure, pressureInches, cloudcover
        case heatIndexC = "HeatIndexC"
        case heatIndexF = "HeatIndexF"
        case dewPointC = "DewPointC"
        case dewPointF = "DewPointF"
        case windChillC = "WindChillC"
        case windChillF = "WindChillF"
        case windGustMiles = "WindGustMiles"
        case windGustKmph = "WindGustKmph"
        case feelsLikeC = "FeelsLikeC"
        case feelsLikeF = "FeelsLikeF"
        case chanceofrain, chanceofremdry, chanceofwindy, chanceofovercast, chanceofsunshine, chanceoffrost, chanceofhightemp, chanceoffog, chanceofsnow, chanceofthunder, uvIndex
    }
}
