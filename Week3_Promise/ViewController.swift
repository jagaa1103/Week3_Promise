//
//  ViewController.swift
//  Week3_Promise
//
//  Created by Enkhjargal Gansukh on 14/08/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var promiseService = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        promiseService = PromiseService()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
