//
//  GameSession.swift
//  WhoWantsToBeAMillioner
//
//  Created by Olga Melnik on 22.10.2019.
//  Copyright © 2019 Olga Melnik. All rights reserved.
//

import Foundation


class GameSession: Codable {
    
    var gameEndAtIndex: Int
    var countOfQuestions: Int
    
    init(gameEndAtIndex: Int, countOfQuestions: Int){
        self.gameEndAtIndex = gameEndAtIndex
        self.countOfQuestions = countOfQuestions
    }
    
    
}
