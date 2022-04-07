//
//  WeatherListViewModelTests.swift
//  GoodWeatherTests
//
//  Created by 董恩志 on 2022/3/24.
//

import XCTest
@testable import GoodWeather

class WeatherListViewModelTests: XCTestCase {

    private var weatherListVM: WeatherListViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        self.weatherListVM = WeatherListViewModel()
        
        self.weatherListVM.addWeatherViewModel(WeatherViewModel(weather: WeatherResponse(name: "Houston", main: Weather(temp: 32, humidity: 0))))
        
        self.weatherListVM.addWeatherViewModel(WeatherViewModel(weather: WeatherResponse(name: "Austin", main: Weather(temp: 72, humidity: 0))))
    }
    
    func test_should_be_able_to_convert_to_celsius_successfully() {
        
        let celsiusTemperatures = [0,22.2222]
        self.weatherListVM.updateUnit(to: .celsius)
        
        #warning("第一次看到")
        for (index, vm) in self.weatherListVM.weatherViewModels.enumerated() {
            
            XCTAssertEqual(round(vm.temperature), round(celsiusTemperatures[index]))
        }
        
    }

    override func tearDownWithError() throws {
        
    }

}
