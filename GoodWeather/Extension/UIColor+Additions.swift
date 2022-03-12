//
//  UIColor+Additions.swift
//  GoodWeather
//
//  Created by 董恩志 on 2022/3/4.
//

import UIKit

extension UIColor {
    
    static func colorRGB(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor {
        return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
