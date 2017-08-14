//
//  ViewController.swift
//  Week3_Promise
//
//  Created by Enkhjargal Gansukh on 14/08/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let promiseService = PromiseService()
        promiseService.getWeather(completion: {
            print("completed")
            if let weather = promiseService.parseJSON() {
                print(weather)
                DispatchQueue.main.async {
                    self.setText(text: "\(weather)")
                }
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setText(text: String){
        self.label.text = text
    }
}

