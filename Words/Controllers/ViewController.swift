//
//  ViewController.swift
//  Words
//
//  Created by Владимир Файб on 22.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var game = WordsBrain() {
        didSet {
            if game.getRunning() {
                cardLabel.text = game.word
            } else if game.getGameOver() {
                cardLabel.text = "Правильных ответов:\n\(game.getCorrect())"
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15){ [weak self] in
                    self!.audioEffects.playSound("alarm_sound")
                        }
               
            } else {
                cardLabel.text = "Нажмите на \"Старт\", когда будете готовы"
            }
        }
    }
    
    var isFlipped = false
    var timer = Timer()
    var audioEffects = AudioEffects()
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
        label.text = "Нажмите на \"Старт\", когда будете готовы"
        label.numberOfLines = 0
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
    
    let cardView: UIView = {
        let view = UIView(frame: .zero)
        let width1 = UIScreen.main.bounds.width * 0.8
        view.backgroundColor = .white
        view.anchor(width: width1, height: 1.5 * width1)
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 5
        return view
    }()
    
    let cardView1: UIView = {
        let view = UIView(frame: .zero)
        let width = UIScreen.main.bounds.width * 0.8
        view.backgroundColor = .white
        view.anchor(width: width, height: 1.5 * width)
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 5
        return view
    }()
    
    
    @objc func startAction() {
        game.start()
        if game.getRunning() {
            startButton.isHidden = true
            skipButton.isHidden = false
            plusButton.isHidden = false
            timer.invalidate()
            secondsPassed = game.time
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        }
    }
    func gameOver() {
        timer.invalidate()
        game.resetGame()
        startButton.isHidden = false
        skipButton.isHidden = true
        plusButton.isHidden = true
        let allert = UIAlertController(title: "Game Over", message: game.joke, preferredStyle: .alert)
        allert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(allert, animated: true, completion: nil)
    }
    
    func animationCard() {
        isFlipped != isFlipped
        let fromView = isFlipped ? cardView : cardView1
        let toView = isFlipped ? cardView1 : cardView
        
        UIView.transition(from: fromView, to: toView, duration: 0.5, options: [.curveEaseOut, .transitionCurlUp, .showHideTransitionViews])
    }
    
    
    @objc func update() {
        if secondsPassed > 0 {
            secondsPassed -= 1
        } else {
           
            gameOver()
        }
    }
    
    @objc func skipAction() {
        game.nextCard()
        if game.getGameOver() { gameOver() }
        audioEffects.playSound("wrong")
        animationCard()
    }
    
    @objc func plusAction() {
        game.plus()
        if game.getGameOver() { gameOver() }
        audioEffects.playSound("right")
        animationCard()
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
        
        cardView.addSubview(cardView1)
      
        let width = UIScreen.main.bounds.width * 0.8

        cardView.addSubview(cardLabel)
      
        
        
        let padding = 10.0
        cardLabel.anchor(top: cardView.topAnchor, left: cardView.leftAnchor, bottom: cardView.bottomAnchor, right: cardView.rightAnchor, paddingTop: padding, paddingLeft: padding, paddingBottom: padding, paddingRight: padding)
        let imageViewBackground = UIImageView()
        imageViewBackground.image = UIImage(named: "words3")
        imageViewBackground.anchor(width: width * 1.1, height: 1.6 * width)
        imageViewBackground.contentMode = .scaleToFill
        view.addSubview(imageViewBackground)
        imageViewBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageViewBackground.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10).isActive = true
        
        
        
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

