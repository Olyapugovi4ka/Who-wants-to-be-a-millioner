//
//  Question.swift
//  WhoWantsToBeAMillioner
//
//  Created by Olga Melnik on 15.10.2019.
//  Copyright © 2019 Olga Melnik. All rights reserved.
//

import Foundation
class Question {
    var question: String
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    
    var rightAnswer: String
    init (question: String, answer1: String, answer2: String, answer3: String, answer4: String, rightAnswer: String){
        self.question = question
        self.answer1 = answer1
        self.answer2 = answer2
        self.answer3 = answer3
        self.answer4 = answer4
        
        self.rightAnswer = rightAnswer
    }
}
