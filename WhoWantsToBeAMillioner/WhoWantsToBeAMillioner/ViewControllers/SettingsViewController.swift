//
//  SettingsViewController.swift
//  WhoWantsToBeAMillioner
//
//  Created by Olga Melnik on 27.10.2019.
//  Copyright © 2019 Olga Melnik. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {

    @IBOutlet weak var chooseOrderControl: UISegmentedControl!
    
 private var selectedOrder : Order {

        switch chooseOrderControl.selectedSegmentIndex {
        case 0:
            return .ordinary
        case 1:
            return .random
        default:
            return .ordinary

            
        }
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        chooseOrderControl.addTarget(self, action: #selector(saveSelectedOrder), for: .valueChanged)
        
    }
    
    @objc func saveSelectedOrder(){
        Game.shared.order = selectedOrder
    }
    
    @IBAction func returnButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
