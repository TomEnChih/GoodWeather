//
//  Constants.swift
//  GoodWeather
//
//  Created by 董恩志 on 2022/3/12.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        static func urlForWeatherByCity(_ city: String) -> URL {
            
            let userDefaults = UserDefaults.standard
            let unit = (userDefaults.value(forKey: "unit") as? String) ?? "imperial"
            
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=ed236d917f6d782dfbb71cca205d514f&units=\(unit)")!
        }
    }
}
