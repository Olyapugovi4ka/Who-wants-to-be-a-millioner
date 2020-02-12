//
//  RecordsCaretaker.swift
//  WhoWantsToBeAMillioner
//
//  Created by Olga Melnik on 21.10.2019.
//  Copyright © 2019 Olga Melnik. All rights reserved.
//

import Foundation

 class RecordsCaretaker {
     private var decoder = JSONDecoder()
     private var encoder = JSONEncoder()
     private let keyForGameSession = "gameSession"
    private let keyForResults = "gameResults"
    
    
     
     func saveGameSession (_ gamesession: GameSession) {
         let data = try! encoder.encode(gamesession)
         UserDefaults.standard.set(data, forKey: keyForGameSession)
        print("GameSession saved")
     }
    
    func saveResults (_ results: [Int]){
        let data = try! encoder.encode(results)
               UserDefaults.standard.set(data, forKey: keyForResults)
        print("results saved")
        
    }
     func loadGameSession() -> GameSession {
        guard let data = UserDefaults.standard.data(forKey: keyForGameSession) else { return GameSession(gameEndAtIndex: 0, countOfQuestions: 0)}
             return try! decoder.decode(GameSession.self, from: data)
        
     }
    
    func loadResults() -> [Int] {
        guard let data = UserDefaults.standard.data(forKey: keyForResults) else { return []}
        return try! decoder.decode([Int].self, from: data)
       
    }
    
//    func load() -> [Record]{
//           guard let data = UserDefaults.standard.data(forKey: key) else { return []}
//               return try! decoder.decode([Record].self, from: data)
//
//       }
 }
