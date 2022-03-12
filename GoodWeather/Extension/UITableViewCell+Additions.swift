//
//  UITableViewCell+Additions.swift
//  GoodWeather
//
//  Created by 董恩志 on 2022/3/5.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    static var id: String {
        return String(describing: Self.self)
    }
}
