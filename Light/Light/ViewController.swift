//
//  ViewController.swift
//  Light
//
//  Created by Mac on 2020-05-13.
//  Copyright © 2020 classWork. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var lightOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: Any) {
        lightOn.toggle()
        updateUI()
    }
    
    
    func updateUI() {
        view.backgroundColor = lightOn ? .white : .black
}
}
