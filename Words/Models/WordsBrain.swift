//
//  WordsBrain.swift
//  Words
//
//  Created by Владимир Файб on 22.03.2022.
//

import Foundation

struct WordsBrain {
  var title = "Угадай"
  var words = ["Россия", "Япония", "Армения", "Австралия", "Монако", "Турция", "Мадагаскар", "США" , "Бразилия", "Перу", "Германия", "Великобритания", "Испания" , "Латвия", "Украина", "Италия"]
  var card = 0
  var correct = 0
  var gameOver = false
  var running = false
  mutating func nextPage() {
    if card < words.count - 1 {
      card += 1
    } else {
      resetGame()
    }
  }
  var correctLabel: String {
    String(correct)
  }
  mutating func plus() {
    correct += 1
    nextPage()
  }
  mutating func start() {
    running = true
  }
  func getRunning() -> Bool {
    running
  }
  func getCorrect() -> Int {
    correct
  }
  func getCard() -> Int {
    card
  }
  func getGameOver() -> Bool {
    gameOver
  }
  mutating func resetGame() {
    gameOver = true
    running = false
  }
}
