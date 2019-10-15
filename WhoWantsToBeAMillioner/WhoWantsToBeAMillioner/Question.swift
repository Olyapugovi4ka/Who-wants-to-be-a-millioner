//
//  Question.swift
//  WhoWantsToBeAMillioner
//
//  Created by Olga Melnik on 15.10.2019.
//  Copyright © 2019 Olga Melnik. All rights reserved.
//

import Foundation
class Question {
    let question: String
    let answer1: String
    let answer2: String
    let answer3: String
    let answer4: String
    
    let rightAnswer: String
    init (question: String, answer1: String, answer2: String, answer3: String, answer4: String, rightAnswer: String){
        self.question = question
        self.answer1 = answer1
        self.answer2 = answer2
        self.answer3 = answer3
        self.answer4 = answer4
        
        self.rightAnswer = rightAnswer
    }
}
