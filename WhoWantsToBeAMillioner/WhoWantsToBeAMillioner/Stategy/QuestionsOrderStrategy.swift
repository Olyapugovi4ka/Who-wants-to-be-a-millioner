//
//  QuestionsOrderStrategy.swift
//  WhoWantsToBeAMillioner
//
//  Created by Olga Melnik on 27.10.2019.
//  Copyright © 2019 Olga Melnik. All rights reserved.
//

import Foundation
protocol QuestionsOrderStrategy {
   
    func showArrayOfQuestions(_ questions: [Question]) -> [Question]
   
}
