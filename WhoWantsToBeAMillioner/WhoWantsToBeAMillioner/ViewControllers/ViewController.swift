//
//  ViewController.swift
//  WhoWantsToBeAMillioner
//
//  Created by Olga Melnik on 13.10.2019.
//  Copyright © 2019 Olga Melnik. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate {
    func didFinishGame(_ gameSession: GameSession)
}

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    let questions = [Question(question: "Как звали пуделя мальвины в сказке Буратино", answer1: "Ардамон", answer2: "Артем", answer3: "Артемон", answer4: "Аккордеон", rightAnswer: "Артемон"),
                     Question(question: "Как звали актрису, сыгравшую главную роль в фильме Джентельмены предпочитают блондинок", answer1: "Мэрилин Керро", answer2: "Скарлет Йохансон", answer3: "Моника Беллучи", answer4: "Мерилин Монро", rightAnswer: "Мерилин Монро"),
    Question(question: "Как звали первого президента России", answer1: "Борис Николаевич Ельцин", answer2: "Владимир Владиморович Путин", answer3: "Дмитрий Анатольевич Медведев", answer4: "Иосиф Виссарионович Сталин", rightAnswer: "Борис Николаевич Ельцин")]
    
    var viewControllerDelegate: ViewControllerDelegate?
    var gameSession : GameSession?

    var indexOfQuestion: Int = 0
    
    var isRight: Bool?
    
    var rightAnswer: String?
    var choosedAnswer: String?
    
    var questionsOrderStrategy: QuestionsOrderStrategy?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showQuestionAtIndex(indexOfQuestion)
        gameSession = GameSession(gameEndAtIndex: indexOfQuestion,
                                  countOfQuestions: questions.count)
       
        Game.shared.gameSession = gameSession
       
    }
    
    func showQuestionAtIndex(_ index: Int) {
        let questions = guestionsOrderStrategy.
        let question = questions[index]
        questionLabel.text = question.question
        answerButton1.setTitle(question.answer1, for: .normal)
        answerButton2.setTitle(question.answer2, for: .normal)
        answerButton3.setTitle(question.answer3, for: .normal)
        answerButton4.setTitle(question.answer4, for: .normal)
        rightAnswer = question.rightAnswer
        
    }
    
    func isRight(buttonTitle: String) -> Bool {
        if rightAnswer == buttonTitle {
            print("Ok")
            return true
        } else {
            print("No")
            return false
        }
    }
    
    @IBAction func choiceButtonPressed(_ sender: UIButton) {
        print(sender.titleLabel!.text!)
     
        if   isRight(buttonTitle: sender.titleLabel!.text!)  {
               indexOfQuestion += 1
            if indexOfQuestion  < questions.count {
                gameSession?.gameEndAtIndex = indexOfQuestion
                viewControllerDelegate?.didFinishGame(gameSession!)
                
                showQuestionAtIndex(indexOfQuestion)
            } else {
                let ac = UIAlertController(title: "Congratulations", message: "You are the winner!!!", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default) { (_) in
                    
                    self.dismiss(animated: true, completion: nil)
                }
                    ac.addAction(ok)
                    present(ac, animated: true, completion: nil)
                
            }
                       
        } else {
            viewControllerDelegate?.didFinishGame(gameSession!)
            Game.shared.findPercent(gameSession!)
            RecordsCaretaker().saveResults(Game.shared.results)
           
            Game.shared.clearGameSession()
            dismiss(animated: true, completion: nil)
        }
    }
    
    private var questionsOrderStrategy: QuestionsOrderStrategy {
        swit
    }
    
}



