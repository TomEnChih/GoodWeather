//
//  Double+Additions.swift
//  GoodWeather
//
//  Created by 董恩志 on 2022/3/12.
//

import Foundation

extension Double {
    
    var formatAsDegree: String {
        return String(format: "%.0f°", self)
    }
}
