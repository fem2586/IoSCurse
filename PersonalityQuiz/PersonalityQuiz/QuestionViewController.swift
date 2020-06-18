//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Mac on 2020-06-18.
//  Copyright © 2020 classWork. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!

    
    @IBOutlet var singleStackView: UIStackView!
        @IBOutlet var singleButton1: UIButton!
        @IBOutlet var singleButton2: UIButton!
        @IBOutlet var singleButton3: UIButton!
        @IBOutlet var singleButton4: UIButton!
        
    @IBOutlet var multipleStackView: UIStackView!
        @IBOutlet var multiLabel1: UILabel!
        @IBOutlet var multiLabel2: UILabel!
        @IBOutlet var multiLabel3: UILabel!
        @IBOutlet var multiLabel4: UILabel!
        
        @IBOutlet var multiSwitch1: UISwitch!
        @IBOutlet var multiSwitch2: UISwitch!
        @IBOutlet var multiSwitch3: UISwitch!
        @IBOutlet var multiSwitch4: UISwitch!
        
    @IBOutlet var rangedStackView: UIStackView!
        @IBOutlet var rangedLabel1: UILabel!
        @IBOutlet var rangedLabel2: UILabel!
        
        @IBOutlet var rangedSlider: UISlider!
    
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    var questions: [Question] = [
        Question(text: "Which food do you like most?",
                 type: .single,
                 answer: [
                    Answer(text: "Steak", type: .dog),
                    Answer(text: "Fish", type: .cat),
                    Answer(text: "Carrots", type: .rabbit),
                    Answer(text: "Corn", type: .turtle)
                ]),
        Question(text: "Which activity do you enjoy?",
                 type: .multiple,
                 answer: [
                    Answer(text: "Swimming", type: .turtle),
                    Answer(text: "Sleeping", type: .cat),
                    Answer(text: "Cuddling", type: .rabbit),
                    Answer(text: "Eating", type: .dog)
                ]),
        
        Question(text: "How much do you enjoy car rides?",
                 type: .ranged,
                 answer: [
                    Answer(text: "I dislike them", type: .cat),
                    Answer(text: "I get a little nervous", type: .rabbit),
                    Answer(text: "I barely notice them", type: .turtle),
                    Answer(text: "I love them", type: .dog)
                ]),
    ]
    
    var answersChosen: [Answer] = []
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        UpdateUI()
    }
    
    func UpdateUI() {
        singleStackView.isHidden    = true
        multipleStackView.isHidden  = true
        rangedStackView.isHidden    = true
    
        navigationItem.title = "Question #\(questionIndex+1) "
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answer
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        
        case .single:
            updateSingleStackView(using: currentAnswers)
        
        case .multiple:
            updateMultipleStackView(using: currentAnswers)
        
        case .ranged:
            updateRangedStackView(using: currentAnswers)
        
        }
        
    }
    
    func updateSingleStackView(using answers: [Answer]){
        singleStackView.isHidden = false

        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
        
    }

    func updateMultipleStackView(using answers: [Answer]){
        multipleStackView.isHidden = false
        
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
        
    }

    func updateRangedStackView(using answers: [Answer]){
        rangedStackView.isHidden = false
        
        rangedSlider.setValue(0.5, animated: false)
        
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
        
    }

    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
    
        let currentAnswers = questions[questionIndex].answer
        
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        
        nextQuestion()
    }
    @IBAction func multipleButtonPressed() {
        
        let currentAnswers = questions[questionIndex].answer
        
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        nextQuestion()
        
    }
    @IBAction func rangedAnswerButtonPressed() {
        
        let currentAnswers = questions[questionIndex].answer
        
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1 )))
        
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    func nextQuestion() {
    
        questionIndex += 1
        
        if questionIndex < questions.count {
            UpdateUI()
        } else {
            performSegue(withIdentifier: "ResultSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultSegue" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.responses = answersChosen
            
        }
    }
}
