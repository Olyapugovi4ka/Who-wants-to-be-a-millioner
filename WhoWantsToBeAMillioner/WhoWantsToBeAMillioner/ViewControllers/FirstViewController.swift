//
//  FirstViewController.swift
//  WhoWantsToBeAMillioner
//
//  Created by Olga Melnik on 15.10.2019.
//  Copyright © 2019 Olga Melnik. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBAction func resultsButton(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startToPlay" {
            guard let destination = segue.destination as? ViewController else { return }
            destination.viewControllerDelegate = self
            if Game.shared.gameSession != nil {
                destination.indexOfQuestion.value = Game.shared.gameSession!.gameEndAtIndex }
            destination.order = Game.shared.order
            print(Game.shared.order)
            print(destination.indexOfQuestion)
        }
    }
    


}
extension FirstViewController: ViewControllerDelegate{
    func didFinishGame(_ gameSession: GameSession) {
        // RecordsCaretaker().saveGameSession(gameSession)
        Game.shared.findPercent(gameSession)
        RecordsCaretaker().saveResults(Game.shared.results)
        
        Game.shared.clearGameSession()
        print("Всего вопросов: \(gameSession.countOfQuestions)" , ", ","получено ответов: \(gameSession.gameEndAtIndex)")
    }
    
    
}



