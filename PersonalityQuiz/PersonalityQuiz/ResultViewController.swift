//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Mac on 2020-06-18.
//  Copyright © 2020 classWork. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDetailLabel: UILabel!
    
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        // Do any additional setup after loading the view.
        navigationItem.hidesBackButton = true
        
    }
    
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        let responsesTypes = responses.map{ $0.type }
        
        for response in responsesTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0 ) + 1
        }
        
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by:
        { (pair1, pair2) -> Bool in
            return pair1.value > pair2.value
        })
        
        let mostCommonAnswer = frequentAnswersSorted.first!.key
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)! "
        resultDetailLabel.text = mostCommonAnswer.definition
    }
 

}
