//
//  NewQuestionController.swift
//  WhoWantsToBeAMillioner
//
//  Created by Olga Melnik on 30.10.2019.
//  Copyright © 2019 Olga Melnik. All rights reserved.
//

import UIKit

class NewQuestionController: UIViewController {
    
    private var newQuestions: [Question] = []

    @IBOutlet weak var addQuestionTableView: UITableView!
    @IBOutlet weak var addNewQuestionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension NewQuestionController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (newQuestions.count + 1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

         let cell = tableView.dequeueReusableCell(withIdentifier: "NewQuestionCell", for: indexPath) as! CustomCell
//        if let question = cell.questionTextField.text,
//            let rightAnswer = cell.rightAnswerTextField.text,
//            let wrongAnswer1 = cell.wrongAnswerTextField1.text,
//            let wrongAnswer2 = cell.wrongAnswerTextField2.text,
//            let wrongAnswer3 = cell.wrongAnswerTextField3.text {
//        newQuestions[indexPath.row].question = question
//        newQuestions[indexPath.row].rightAnswer = rightAnswer
//            var temporaryArray: [String] = []
//            
//            temporaryArray.append(wrongAnswer1)
//            temporaryArray.append(wrongAnswer2)
//            temporaryArray.append(wrongAnswer3)
//            temporaryArray.append(rightAnswer)
//            var newTemporaryArray: [String] = []
//            for _ in 0..<temporaryArray.count {
//                let index = Int.random(in: 0..<temporaryArray.count)
//                newTemporaryArray.append(temporaryArray[index])
//                temporaryArray.remove(at: index)
//            }
//            newQuestions[indexPath.row].answer1 = newTemporaryArray[0]
//            newQuestions[indexPath.row].answer2 = newTemporaryArray[1]
//            newQuestions[indexPath.row].answer3 = newTemporaryArray[2]
//            newQuestions[indexPath.row].answer4 = newTemporaryArray[3]
//        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
