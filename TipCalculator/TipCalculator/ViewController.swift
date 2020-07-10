//
//  ViewController.swift
//  TipCalculator
//
//  Created by Mac on 2020-07-08.
//  Copyright © 2020 classWork. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var billAmountLabel: UILabel!

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipAmountSlider: UISlider!
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var tipsAmountLabel: UILabel!
   
    var tipCalculator = TipCalculator(amountBeforeTips: 0, tipsPercentage: 10)
  
    override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
        billAmountTextField.becomeFirstResponder()
      }

    func calculateBill(){
        tipCalculator.tipsPercentage = Double(tipAmountSlider.value) / 100.0
        tipCalculator.amountBeforeTips = (billAmountTextField.text! as NSString).doubleValue
        tipCalculator.calculatorTip()
        UpdateUI()
    }
    
    func UpdateUI(){
        totalAmountLabel.text = String(format: "$%0.2f", tipCalculator.totalAmount)
        tipsAmountLabel.text  = String(format: "$%0.2f", tipCalculator.tipsAmount)
    }
    
    @IBAction func tipSliderValueChanged(sender: Any) {
        tipLabel.text = String(format: "Tips: %02d%%", Int(tipAmountSlider.value))
        calculateBill()
        
    }
    
    @IBAction func amountBeforeTipsTextFieldChanged(sender: Any) {
        calculateBill()
    }
    
  

}

