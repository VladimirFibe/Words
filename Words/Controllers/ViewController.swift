//
//  ViewController.swift
//  Words
//
//  Created by Владимир Файб on 22.03.2022.
//

import UIKit

class ViewController: UIViewController {
  var timer = Timer()
  var totalTime = 60
  var secondsPassed = 0 {
    didSet {
      timerLabel.text = "\(secondsPassed)"
    }
  }
  
  let scoreLabel: UILabel = {
    let label = UILabel()
    label.text = "Score"
    label.font = .systemFont(ofSize: 25)
    return label
  }()
  
  let cardLabel: UILabel = {
    let label = UILabel()
    label.text = "нечетное число"
    label.font = .systemFont(ofSize: 40)
    label.textAlignment = .center
    return label
  }()
  
  let timerLabel: UILabel = {
      let label = UILabel()
    label.font = .boldSystemFont(ofSize: 90)
    label.text = "60"
    label.textColor = .white
      return label
  }()
  
  let skipButton: GameButton = {
    let button = GameButton(type: .system)
    button.configure(color: .systemRed, image: "xmark")
    button.addTarget(nil, action: #selector(skipAction), for: .touchUpInside)
    button.isHidden = true
    return button
  }()
  
  let plusButton: GameButton = {
    let button = GameButton(type: .system)
    button.configure()
    button.addTarget(nil, action: #selector(plusAction), for: .touchUpInside)
    button.isHidden = true
    return button
  }()
  
  let startButton: GameButton = {
    let button = GameButton(type: .system)
    button.configure(color: .systemBlue, image: "play")
    button.addTarget(nil, action: #selector(startAction), for: .touchUpInside)
    return button
  }()
  
  @objc func startAction() {
    startButton.isHidden = true
    skipButton.isHidden = false
    plusButton.isHidden = false
    timer.invalidate()
    secondsPassed = totalTime
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
  }
  func gameOver() {
    timer.invalidate()
    timerLabel.text = "Game Over"
  }
  @objc func update() {
    if secondsPassed > 0 {
      secondsPassed -= 1
    } else {
      gameOver()
    }
  }
  
  @objc func skipAction() {
  }
  
  @objc func plusAction() {
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    configureBackground()
    configureUI()
  }

  func configureUI() {
    view.backgroundColor = .systemBackground
    title = "Скажи иначе"
    
    let buttonsStack = UIStackView(arrangedSubviews: [startButton, skipButton, plusButton])
    buttonsStack.axis = .horizontal
    buttonsStack.distribution = .equalSpacing
    buttonsStack.spacing = 20
    
    let cardView = UIView(frame: .zero)
    let width = UIScreen.main.bounds.width * 0.8
    cardView.anchor(width: width, height: 1.5 * width)
    cardView.layer.cornerRadius = 20
    cardView.layer.borderColor = UIColor.black.cgColor
    cardView.layer.borderWidth = 5
    cardView.backgroundColor = .white
    cardView.addSubview(cardLabel)
    let padding = 10.0
    cardLabel.anchor(top: cardView.topAnchor, left: cardView.leftAnchor, bottom: cardView.bottomAnchor, right: cardView.rightAnchor, paddingTop: padding, paddingLeft: padding, paddingBottom: padding, paddingRight: padding)
    let stack = UIStackView(arrangedSubviews: [timerLabel, cardView, buttonsStack])
    stack.axis = .vertical
    stack.distribution = .equalSpacing
    stack.alignment = .center
    
    view.addSubview(stack)
    let margins = view.layoutMarginsGuide
    stack.anchor(top: margins.topAnchor, left: margins.leftAnchor, bottom: margins.bottomAnchor, right: margins.rightAnchor, paddingTop: 10, paddingBottom: 10)
  }
  func configureBackground() {
    let gradient = CAGradientLayer()
    gradient.startPoint = CGPoint(x: 0, y: 0)
    gradient.endPoint = CGPoint(x: 1, y: 1)
    gradient.colors = [UIColor.blue.cgColor, UIColor.red.cgColor]
    gradient.frame = view.bounds
    view.layer.insertSublayer(gradient, at: 0)
  }
}

