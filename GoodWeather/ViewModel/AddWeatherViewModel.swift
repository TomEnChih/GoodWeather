//
//  AddWeatherViewModel.swift
//  GoodWeather
//
//  Created by 董恩志 on 2022/3/12.
//

import Foundation

class AddWeatherViewModel {
    
    func addWeather(fot city: String, compleiton: @escaping (WeatherViewModel)-> Void) {
        
        let weatherURL = Constants.Urls.urlForWeatherByCity(city)
        
        let weatherResource = Resource<WeatherResponse>(url: weatherURL) { data in
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            return weatherResponse
        }
        
        Webservice().load(resource: weatherResource) { result in
            
            if let weatherResponse = result {
                let vm = WeatherViewModel(weather: weatherResponse)
                compleiton(vm)
            }
        }
    }
}
