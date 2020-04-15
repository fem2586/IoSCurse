//
//  ViewController.swift
//  Hello
//
//  Created by Mac on 2020-04-14.
//  Copyright © 2020 classWork. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // implicity unrapped optional (!)
    @IBOutlet var MyBut1: UIButton!
    
    //UIkit
    // CA = core animation
    // CG = core graphics rectangle
    private let nameLabel: UILabel = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // initialize properties
        // view.backgroundColor = .red
    
        MyBut1.setTitle("Yes!", for: .normal)
        
        view.addSubview(nameLabel)
        nameLabel.text = "Hello"
    
    }


    @IBAction func MyButton(_ sender: UIButton) {
        print("Button tapped")
    }
}

