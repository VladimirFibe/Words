//
//  QuestionModel.swift
//  Words
//
//  Created by Andrei Panasenko on 23.03.2022.
//

import Foundation

struct Question {
    let word: String
    var date: Date
    
    init(word: String) {
        self.word = word
        self.date = Date()
    }
}
