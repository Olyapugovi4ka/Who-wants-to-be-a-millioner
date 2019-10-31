//
//  RandomOrderStrategy.swift
//  WhoWantsToBeAMillioner
//
//  Created by Olga Melnik on 27.10.2019.
//  Copyright © 2019 Olga Melnik. All rights reserved.
//

import Foundation

final class RandomOrderStrategy: QuestionsOrderStrategy {
    
    func showArrayOfQuestions(_ questions: [Question]) -> [Question] {
        
        var newQuestions = questions
        var newArrayOfQuestions: [Question] = []
        
        for _ in 0 ..< newQuestions.count {
            let index = Int.random(in: 0 ..< newQuestions.count)
            newArrayOfQuestions.append(newQuestions[index])
            newQuestions.remove(at: index)
        }
        return newArrayOfQuestions
    }
}



