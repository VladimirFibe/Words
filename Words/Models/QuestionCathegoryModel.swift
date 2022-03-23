//
//  QuestionCathegoryModel.swift
//  Words
//
//  Created by Andrei Panasenko on 23.03.2022.
//

import Foundation

struct QuestionCathegory {
    var filePath: String = "words"
    var QuestionList: [Question] = [Question(word: "first question")]
    var currentQuestion = 0
    
//    если будем добавлять картинку категории
//    var image =
    
    // MARK: - нужно инициализировать в didLoad

    // MARK: - обновление вью

    func getCurrentQuestion() -> String {
        return QuestionList[currentQuestion].word
    }
    
    // MARK: - методы вопросов

    mutating func loadQuestions() {
        var words = [String]()
        if let path = Bundle.main.path(forResource: filePath, ofType: "test.txt") {
            do {
                let text = try String(contentsOfFile: path, encoding: .utf8)
                words = text.components(separatedBy: "\n").filter { $0 != "" }
            } catch {
                print("error \(error) encoding list of words")
            }
        }
        QuestionList = []
        for word in words {
            let newQuestion = Question(word: word)
            QuestionList.append(newQuestion)
            QuestionList.shuffle()
        }
    }
    
    mutating func resetQuestions() {
        QuestionList = QuestionList.sorted(by: { q1, q2 in
            q1.date < q2.date
        })
        currentQuestion = 0
    }
    
    mutating func nextQuestion() {
        if currentQuestion + 1 < QuestionList.count {
            QuestionList[currentQuestion].date = Date()
            currentQuestion += 1
        } else {
            QuestionList[currentQuestion].date = Date()
            currentQuestion = 0
        }
    }
}
