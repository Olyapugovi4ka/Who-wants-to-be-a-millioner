//
//  NewQuestionController.swift
//  WhoWantsToBeAMillioner
//
//  Created by Olga Melnik on 30.10.2019.
//  Copyright © 2019 Olga Melnik. All rights reserved.
//

import UIKit

class NewQuestionController: UIViewController {

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
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        switch indexPath.row {
//        case 0:
//         let cell = tableView.dequeueReusableCell(withIdentifier: "NewQuestionCell", for: indexPath) as! CustomCell
//        cell.textfield(UITextField) {
//            
//        }
//        }
        return cell
    }
    
    
}
