//
//  Game.swift
//  WhoWantsToBeAMillioner
//
//  Created by Olga Melnik on 18.10.2019.
//  Copyright © 2019 Olga Melnik. All rights reserved.
//

import Foundation

final class Game: Codable {
    
    static let shared = Game()
    var gameSession: GameSession?
    var order: Order = .ordinary
    
    var results: [Int] =  []
    
    
    private init() {
    }
    
    func findPercent( _ gameSession: GameSession){
        let percent = (self.gameSession!.gameEndAtIndex * 100) / self.gameSession!.countOfQuestions
        print(percent)
        results.append(percent)
        print("Percent was found")
    }
    
    func addResults(_ results: [Int]) {
        results.forEach { (result) in
            self.results.append(result)
            print("Record was added")
        }
    }
    func clearGameSession() {
        self.gameSession = nil
    }
    
}

