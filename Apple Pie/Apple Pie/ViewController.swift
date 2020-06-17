//
//  ViewController.swift
//  Apple Pie
//
//  Created by Mac on 2020-06-16.
//  Copyright © 2020 classWork. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var CorrectWorldLabel: UILabel!
    @IBOutlet var ScoreLabel: UILabel!
    @IBOutlet var TreeImageView: UIImageView!
    @IBOutlet var lettersButtons: [UIButton]!
    
    var listOfWorlds = [ "buccaneer", "swift", "glorious", "incandescent", "bug", "program" ]

    let incorrectMovesAllowed = 7
    var totalWins = 0  { didSet { newRound() } }
    var totalLoses = 0 { didSet { newRound() } }
    var currentGame: Game!
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)
        let letter = Character(letterString!.lowercased())
        currentGame.playerGuessed(letter: letter)
        
        UpdateGameState()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }

    @objc func newRound(){
        if !listOfWorlds.isEmpty{
        let newWord = listOfWorlds.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guestLetters: []  )
        EnableLetterButtons(true)
            
        UpdateUI()
        } else { EnableLetterButtons(false) }
    }
    
    func EnableLetterButtons( _ enable: Bool){
        for button in lettersButtons {
            button.isEnabled = enable
        }
    }

    func UpdateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord
        { letters.append(String(letter)) }
        let wordSpacing = letters.joined(separator: " ")
        
        CorrectWorldLabel.text = wordSpacing
        ScoreLabel.text = "Wins: \(totalWins), Losses: \(totalLoses)"
        TreeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        
    }
    func UpdateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLoses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins  += 1
        } else { UpdateUI() }
    }
}

