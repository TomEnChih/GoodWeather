//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by 董恩志 on 2022/3/12.
//

import Foundation

//MARK: - WeatherListViewModel
class WeatherListViewModel {
    
    var weatherViewModels = [WeatherViewModel]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    var reloadTableViewClosure: (()->Void)?
    
    func addWeatherViewModel(_ vm: WeatherViewModel) {
        weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return weatherViewModels.count
    }
    
    func modelAt(_ indexPath: IndexPath) -> WeatherViewModel {
        return weatherViewModels[indexPath.row]
    }
    
    private func toCelsius() {
        
        #warning("第一次這樣用")
        weatherViewModels = weatherViewModels.map { vm in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature - 32) * 5/9
            return weatherModel
        }
    }
    
    private func toFahrenheit() {
        
        weatherViewModels = weatherViewModels.map { vm in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature * 9/5) + 32
            return weatherModel
        }
    }
    
    func updateUnit(to unit: Unit) {
        switch unit {
        case .celsius:
            toCelsius()
            
        case .fahrenheit:
            toFahrenheit()
        }
    }
}


//MARK: - WeatherViewModel
class WeatherViewModel {
    
    let weather: WeatherResponse
    var temperature: Double
    
    // MARK: - Init
    init(weather: WeatherResponse) {
        self.weather = weather
        self.temperature = weather.main.temp
    }
    
    var city: String {
        return weather.name
    }
}
