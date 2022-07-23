//
//  Model.swift
//  HorseWeather
//
//  Created by 児島　陸斗 on 2022/07/15.
//

import Foundation

struct WeatherModel: Codable {
    let timezone: String
    let current: CurrentWeather
    let hourly: [HourWeather]
}

struct CurrentWeather: Codable {
    let temp: Double
    let dt: Date
    let weather: [WeatherInfo]
}

struct WeatherInfo: Codable {
    let main: String
    let description: String
    let icon: String
}

struct HourWeather: Codable {
    let weather: [HourInfo]
    var pop: Double = 0.0
    var temp: Double = 0.0
}

struct HourInfo: Codable{
    let main: String?
    let icon: String
}

