//
//  PromiseTest.swift
//  Week3_Promise
//
//  Created by Enkhjargal Gansukh on 14/08/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import Foundation


class PromiseService {
    let urlString = URL(string:"http://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b1b15e88fa797225412429c1c50c122a1")
    func getWeather(){
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let err = error {
                    print(err)
                } else {
                    if let okData = data {
                        if let str = String(bytes: okData, encoding: String.Encoding.utf8) {
                            print(str)
                        }
                    } else {
                        print("No data exist")
                    }
                }
            }
            task.resume()
        }
    }
}
