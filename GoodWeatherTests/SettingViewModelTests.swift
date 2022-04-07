//
//  SettingViewModelTests.swift
//  GoodWeatherTests
//
//  Created by 董恩志 on 2022/3/22.
//

import XCTest
@testable import GoodWeather

class SettingViewModelTests: XCTestCase {

    private var settingVM: SettingViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        self.settingVM = SettingViewModel()
    }
    
    func test_should_make_sure_that_default_selected_unit_is_fahrenheit() {
        
        XCTAssertEqual(settingVM.selectedUnit, .fahrenheit)
    }
    
    func test_should_be_able_to_save_user_unit_selectino() {
        
        self.settingVM.selectedUnit = .celsius
        let userDefaults = UserDefaults.standard
        XCTAssertNotNil(userDefaults.value(forKey:"unit"))
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "unit")
    }

}
