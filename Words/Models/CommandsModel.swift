//
//  CommandsModel.swift
//  Words
//
//  Created by Andrei Panasenko on 23.03.2022.
//

import Foundation

struct Commands {
    var commands: [Command] = [Command(name: "first command")]
    let filePath = "команды"
    var numberOfCommands = 2
    var currentRound = 0
    var currentTeam = 0
    
    // MARK: - инициализация

    // MARK: обновление вью
    
    func getCurrentTeam() -> String {
        return commands[currentTeam].name
    }
    
    func getCurrentPoints() -> String {
        return String(commands[currentTeam].points)
    }
    
    func getAllScores() -> String {
        var all = ""
        for team in commands {
            let command = "команда \(team.name) заработала \(String(team.points)) очков"
            all += command
            all += "\n"
        }
        return all
    }

    
    mutating func loadCommands() {
        var comm = [String]()
        if let path = Bundle.main.path(forResource: filePath, ofType: "test.txt") {
            do {
                let text = try String(contentsOfFile: path, encoding: .utf8)
                comm = text.components(separatedBy: "\n").filter { $0 != "" }
            } catch {
                print("error \(error) encoding commands")
            }
        }
        commands = []
        for i in 0 ..< numberOfCommands {
            var command = Command(name: comm[i])
            commands.append(command)
        }
    }
    
    mutating func saveCommand(newCommand: String) {
        let newCommand = Command(name: newCommand)
        commands.insert(newCommand, at: 0)
    }
    
    mutating func resetPoints() {
        for i in 0 ..< commands.count {
            commands[i].points = 0
        }
        currentTeam = 0
        currentRound = 0
    }
    
    mutating func addPoint() {
        commands[currentTeam].points += 1
    }
    
    mutating func deletePoint() {
        commands[currentTeam].points -= 1
    }
    
    mutating func nextTeam() {
        if currentTeam + 1 < commands.count {
            currentTeam += 1
        } else {
            currentTeam = 0
            currentRound += 1
        }
    }
    
}
