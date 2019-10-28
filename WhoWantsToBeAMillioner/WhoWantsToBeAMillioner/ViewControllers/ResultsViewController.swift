//
//  ResultsViewController.swift
//  WhoWantsToBeAMillioner
//
//  Created by Olga Melnik on 15.10.2019.
//  Copyright © 2019 Olga Melnik. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
}

extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if  let cell =  tableView.dequeueReusableCell(withIdentifier: "Cell") {
        let result = Game.shared.results[indexPath.row]
        cell.textLabel?.text = "Результат игры: \(result) %"
        return cell
            
        }
        return  UITableViewCell()
    }
    
    
}
