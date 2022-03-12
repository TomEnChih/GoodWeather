//
//  WeaterListTableViewController.swift
//  GoodWeather
//
//  Created by 董恩志 on 2022/3/4.
//

import UIKit

class WeaterListTableViewController: UITableViewController {
    
    // MARK: - Properties
    private let weatherListViewModel = WeatherListViewModel()
    private var lastUnitSelection: Unit!
    
    // MARK: - UIElements
        
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setAction()
        setupDefaultSetting()
    }
    
    // MARK: - Methods
    private func setView() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "GoodWeather"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addCity))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(changeSetting))
        
        tableView.register(WeatherCell.self, forCellReuseIdentifier: WeatherCell.id)
        tableView.backgroundColor = .secondarySystemBackground
        tableView.separatorStyle = .none
        
        let userDefaults = UserDefaults.standard
        if let value = userDefaults.value(forKey: "unit") as? String {
            self.lastUnitSelection = Unit(rawValue: value)!
        }
    }
    
    @objc func addCity() {
        let vc = AddWeatherCityViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func changeSetting() {
        let vc = SettingTableViewController()
        vc.delegate = self
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
    }
    
    private func setAction() {
        
        weatherListViewModel.reloadTableViewClosure = {
            self.tableView.reloadData()
        }
    }
    
    private func setupDefaultSetting() {
         
        let userDefaults = UserDefaults.standard
        
        guard let value = userDefaults.value(forKey: "unit") as? String else {
            userDefaults.set(Unit.fahrenheit.rawValue, forKey: "unit")
            return
        }
        self.lastUnitSelection = Unit(rawValue: value)!
    }
    
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension WeaterListTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherCell.id, for: indexPath) as! WeatherCell
        let weatherVM = weatherListViewModel.modelAt(indexPath)
        cell.configure(weatherVM)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

//MARK: - AddWeatherDelegate
extension WeaterListTableViewController: AddWeatherDelegate {
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(vm)
    }
}

//MARK: - SettingDelegate
extension WeaterListTableViewController: SettingDelegate {
    
    func settingDone(vm: SettingViewModel) {
        if lastUnitSelection.rawValue != vm.selectedUnit.rawValue {
            weatherListViewModel.updateUnit(to: vm.selectedUnit)
            tableView.reloadData()
            lastUnitSelection = Unit(rawValue: vm.selectedUnit.rawValue)!
        }
    }
}
