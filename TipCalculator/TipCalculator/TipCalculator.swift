//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by Mac on 2020-07-10.
//  Copyright © 2020 classWork. All rights reserved.
//

import Foundation

class TipCalculator {
    var amountBeforeTips: Double = 0
    var tipsAmount      : Double = 0
    var tipsPercentage  : Double = 0
    var totalAmount     : Double = 0
    
    init(amountBeforeTips: Double,tipsPercentage: Double ) {
        self.amountBeforeTips   = amountBeforeTips
        self.tipsPercentage     = tipsPercentage
    }
    
    func calculatorTip(){
       tipsAmount   = amountBeforeTips * tipsPercentage
       totalAmount  = amountBeforeTips + tipsAmount
    }
}
