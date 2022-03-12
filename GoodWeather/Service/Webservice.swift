//
//  Webservice.swift
//  GoodWeather
//
//  Created by 董恩志 on 2022/3/5.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data)-> T? //JSON解析
}

final class Webservice {
    
    func load<A>(resource: Resource<A>, completion: @escaping (A?) -> Void) {
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            
            print(data)
            
            if let data = data {
                DispatchQueue.main.async {
                    //resource.parse(data) -> JSON解析過的model
                    completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
            
        }.resume()
    }
    
}
