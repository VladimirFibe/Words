//
//  CommandModel.swift
//  Words
//
//  Created by Andrei Panasenko on 23.03.2022.
//

import Foundation

struct Command {
    var name: String
    var points: Int
    
    init(name: String) {
        self.name = name
        points = 0
    }
}
