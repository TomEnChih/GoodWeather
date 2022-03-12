//
//  WeatherResponse.swift
//  GoodWeather
//
//  Created by 董恩志 on 2022/3/5.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
