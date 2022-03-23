//
//  TempViewHowItWorks.swift
//  Words
//
//  Created by Andrei Panasenko on 23.03.2022.
//

import Foundation

// получаем данные из вью настроек
// настройки игры
//VC.teams = Int(selectTeamStepper.value)
//VC.time = Int(timerSetSlider.value)
//VC.rounds = Int(numOfRoundField.text!) ?? 5
//class TempViewControllerTest: UIViewController {
    
    // MARK: -  инициализация и обновление вью
//    var cathegory = "words"
//    var rounds = 5
//    var time = 5
//    var teams = 2
//
//    var commands = Commands() {
//        didSet {
//            currentPoints.text = "играет команда \(commands.getCurrentTeam()) и у нее очков \(commands.getCurrentPoints())"
//        }
//    }
//    var questions = QuestionCathegory() {
//        didSet {
//            currentQuestion.text = questions.getCurrentQuestion()
//        }
//    }
//
//    var timer = Timer()
//    var timePasssed = 0
    
//    var jokesManager = NetworkManager()
    
    
//     MARK: - подгрузка данных на игру
//    override func loadView() {
//        super.loadView()
//
//        commands.numberOfCommands = teams
//        commands.loadCommands()
//        questions.filePath = cathegory
//        questions.loadQuestions()
//
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        jokesManager.delegate = self
//    }
    
    // MARK: - методы для кнопок
    
//    @objc func restartButtonPressed() {
//        commands.resetPoints()
//        questions.resetQuestions()
    
//    jokesManager.fetchJoke()
//    }
//
//    @objc func startButtonPressed() {
//        setTimer()
//        commands.nextTeam()
//
//        print(commands.currentRound)
//
//        // не работает
//        if commands.currentRound == rounds {
//            currentPoints.text = commands.getAllScores()
//            print(commands.getAllScores())
//        }
//    }
//
//    @objc func rightButtonPressed() {
//        commands.addPoint()
//    }
//
//    @objc func wrongButtonPressed() {
//        commands.deletePoint()
//    }
//
//    func activateButtons() {
//        print("pressed")
//        rightButton.isEnabled = !rightButton.isEnabled
//        wrongButton.isEnabled = !wrongButton.isEnabled
//        currentQuestion.isHidden = !currentQuestion.isHidden
//    }
//
//    func setTimer() {
//        timePasssed = 0
//        timer.invalidate()
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
//    }
//
//
//    @objc func updateTimer() {
//        if timePasssed < time {
//            timePasssed += 1
//            timerLabel.text = String(time - timePasssed)
//        } else {
//            timePasssed = 0
//            timer.invalidate()
//        }
//    }

//}

//extension GameViewControllerTest: NetworkManagerDelegate {
//    func didFailWithError(error: Error) {
//        print(error)
//    }
//
//    func getJoke(_ jokeManager: NetworkManager, joke: JokesArr) {
//        DispatchQueue.main.async {
//            self.currentQuestion.text = joke.jokes
//            print(joke.jokes)
//        }
//    }
//
//}
