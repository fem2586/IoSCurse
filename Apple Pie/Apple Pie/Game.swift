//
//  Game.swift
//  Apple Pie
//
//  Created by Mac on 2020-06-17.
//  Copyright © 2020 classWork. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guestLetters: [Character]
    
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guestLetters.contains(letter) { guessedWord += "\(letter)" }
            else { guessedWord += "_" }
        }
        return guessedWord
    }
    
    
    mutating func playerGuessed(letter: Character) {
        guestLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
            
        }
    }
}
