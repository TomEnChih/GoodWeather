//
//  String+Additions.swift
//  GoodWeather
//
//  Created by 董恩志 on 2022/3/12.
//

import Foundation

extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
