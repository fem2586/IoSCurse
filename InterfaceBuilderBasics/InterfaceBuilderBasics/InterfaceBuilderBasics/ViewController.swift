//
//  ViewController.swift
//  InterfaceBuilderBasics
//
//  Created by Mac on 2020-04-15.
//  Copyright © 2020 classWork. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var mainLabel: UILabel!
    
    @IBAction func changeTitle(_ sender: UIButton) {
        mainLabel.text = "This app rocks!"
    }
}

