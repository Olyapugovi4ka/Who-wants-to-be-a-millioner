//
//  RandomShowQuestion.swift
//  WhoWantsToBeAMillioner
//
//  Created by Olga Melnik on 27.10.2019.
//  Copyright © 2019 Olga Melnik. All rights reserved.
//

import Foundation

final class RandomShowQuestion: QuestionsOrderStrategy {
    func showArrayOfQuestions(_ questions: [String]) -> [String] {
        var questions = questions
        var newArrayOfQuestions: [String] = []
        for _ in 0 ..< questions.count {
            let index = Int.random(in: 0..<questions.count)
            newArrayOfQuestions.append(questions[index])
            questions.remove(at: index)
        }
        return newArrayOfQuestions
    }
}



