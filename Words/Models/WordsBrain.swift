//
//  WordsBrain.swift
//  Words
//
//  Created by Владимир Файб on 22.03.2022.
//

import Foundation

struct WordsBrain {
  var title = "Угадай"
  var words = ["рабочий", "радио", "развитие", "разряд", "ракета", "раковая клетка", "раковина", "ралли", "ранец", "резать", "река", "реформа", "ржаной хлеб", "ров с водой", "родина", "родинка", "роликовые коньки", "росток", "рубин", "рукав", "рукопожатие", "румянец", "рыба", "рыбак", "рыцарь", "рычание"]
  var joke = "Существует два вида языков программирования: одни – все ругают, другими не пользуются"
  var card = 0
  var correct = 0
  var time = 60
  var gameOver = false
  var running = false
    
  mutating func nextCard() {
    if card < words.count - 1 {
      card += 1
    } else {
      resetGame()
    }
  }
    
  var word: String {
    words[card]
  }
    
  var correctLabel: String {
    String(correct)
  }
    
  mutating func plus() {
    correct += 1
    nextCard()
  }
    
  mutating func start() {
    if !gameOver {
      running = true
    }
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
