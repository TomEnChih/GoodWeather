//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by 董恩志 on 2022/3/4.
//

import UIKit

protocol AddWeatherDelegate: NSObject {
    func  addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {

    // MARK: - Properties
    private let addWeatherCityView = AddWeatherCityView()
    
    private let addWeatherVM = AddWeatherViewModel()
    
    weak var delegate: AddWeatherDelegate?
    
    // MARK: - UIElements
        
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setAction()
    }

    // MARK: - Methods
    private func setView() {
        view = addWeatherCityView
        self.navigationItem.title = "Add City"
    }
    
    private func setAction() {
        
        addWeatherCityView.saveCityBtnClosure = { [self] in
            
            if let city = addWeatherCityView.textField.text {
                
                addWeatherVM.addWeather(fot: city) { vm in
                    
                    delegate?.addWeatherDidSave(vm: vm)
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }

}
