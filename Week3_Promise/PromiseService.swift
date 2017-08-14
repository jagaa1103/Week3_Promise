//
//  PromiseTest.swift
//  Week3_Promise
//
//  Created by Enkhjargal Gansukh on 14/08/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import CoreLocation

class PromiseService {
    let urlString = URL(string:"http://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b1b15e88fa797225412429c1c50c122a1")
    var data: Data? = nil
    func getWeather(completion: @escaping ()->()){
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let err = error {
                    print(err)
                } else {
                    if data != nil {
                        self.data = data
                        completion()
                    } else {
                        print("No data exist")
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON() -> Weather? {
        if let rawData = data {
            do {
                let json = try JSONSerialization.jsonObject(with: rawData, options: .allowFragments) as! [String: Any]
                return Weather(data: json)
            }catch{
                print(error)
                return nil
            }
        } else {
            return nil
        }
    }
}

struct Weather {
    var name: String = ""
    var temperature: Double = 0.0
    var pressure: Int = 0
    var humidity: Int = 0
    var temp_max: Double = 0.0
    var temp_min: Double = 0.0
    init(data: [String: Any]) {
        self.name = data["name"] as! String
        if let main = data["main"] as? [String: AnyObject] {
            self.temperature = main["temp"] as! Double
            self.pressure = main["pressure"] as! Int
            self.humidity = main["humidity"] as! Int
            self.temp_max = main["temp_max"] as! Double
            self.temp_min = main["temp_min"] as! Double
        }
    }
}
