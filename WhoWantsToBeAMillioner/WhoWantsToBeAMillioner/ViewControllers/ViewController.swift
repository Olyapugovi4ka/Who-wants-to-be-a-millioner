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
    @IBOutlet weak var currentQuestionLabel: UILabel!
    
    var questions = [Question(question: "Как звали пуделя мальвины в сказке Буратино", answer1: "Ардамон", answer2: "Артем", answer3: "Артемон", answer4: "Аккордеон", rightAnswer: "Артемон"),
                     Question(question: "Как звали актрису, сыгравшую главную роль в фильме Джентельмены предпочитают блондинок", answer1: "Мэрилин Керро", answer2: "Скарлет Йохансон", answer3: "Моника Беллучи", answer4: "Мерилин Монро", rightAnswer: "Мерилин Монро"),
    Question(question: "Как звали первого президента России", answer1: "Борис Николаевич Ельцин", answer2: "Владимир Владиморович Путин", answer3: "Дмитрий Анатольевич Медведев", answer4: "Иосиф Виссарионович Сталин", rightAnswer: "Борис Николаевич Ельцин")]
    
    var viewControllerDelegate: ViewControllerDelegate?
    var gameSession : GameSession?
    
    var order: Order = .ordinary

    var indexOfQuestion: Observable<Int> = Observable(0)
    
    
    var isRight: Bool?
    
    var rightAnswer: String?
    var choosedAnswer: String?
    
    private var questionsOrderStrategy: QuestionsOrderStrategy {
           switch self.order {
           case .ordinary:
               return SequentialOrderStrategy()
           case .random:
               return RandomOrderStrategy()
           }
       }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questions = questionsOrderStrategy.showArrayOfQuestions(self.questions)
        
        //MARK: - add observer for index of questionn
        indexOfQuestion.addObserver(self, options: [.new, .initial]) { [weak self](newValue, _) in
            guard let questionsCount = self?.questions.count else { return }
            if (self?.indexOfQuestion.value)! < questionsCount {
            let currentIndex = newValue + 1
            self?.currentQuestionLabel.text = "Вопрос номер \(currentIndex) из \(questionsCount)"
            } else {
                self!.indexOfQuestion.removeObserver(self!.indexOfQuestion)
                self!.currentQuestionLabel.isHidden = true
            }
        }
        
        

        showQuestionAtIndex(indexOfQuestion.value)
        gameSession = GameSession(gameEndAtIndex: indexOfQuestion.value,
                                  countOfQuestions: questions.count)
       
        Game.shared.gameSession = gameSession
        
       
    }
 
    func showQuestionAtIndex(_ index: Int) {
       
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
            print(indexOfQuestion)
            indexOfQuestion.value += 1
            if indexOfQuestion.value  < questions.count {
                gameSession?.gameEndAtIndex = indexOfQuestion.value
                //viewControllerDelegate?.didFinishGame(gameSession!)
                
                showQuestionAtIndex(indexOfQuestion.value)
            } else {
                gameSession?.gameEndAtIndex = indexOfQuestion.value
                let ac = UIAlertController(title: "Congratulations", message: "You are the winner!!!", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default) { (_) in
                    self.viewControllerDelegate?.didFinishGame(self.gameSession!)
//                    Game.shared.findPercent(self.gameSession!)
//                    RecordsCaretaker().saveResults(Game.shared.results)
//                    Game.shared.clearGameSession()
                    self.dismiss(animated: true, completion: nil)
                }
                ac.addAction(ok)
                present(ac, animated: true, completion: nil)
                
            }
                       
        } else {
            viewControllerDelegate?.didFinishGame(gameSession!)
//            Game.shared.findPercent(gameSession!)
//            RecordsCaretaker().saveResults(Game.shared.results)
//
//            Game.shared.clearGameSession()
            dismiss(animated: true, completion: nil)
        }
    }
    
   
    
}



