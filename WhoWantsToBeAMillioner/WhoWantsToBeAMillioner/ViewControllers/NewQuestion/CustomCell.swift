//
//  CustomCell.swift
//  WhoWantsToBeAMillioner
//
//  Created by Olga Melnik on 30.10.2019.
//  Copyright © 2019 Olga Melnik. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
   
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var rightAnswerTextField: UITextField!
    
    @IBOutlet weak var wrongAnswerTextField1: UITextField!
    @IBOutlet weak var wrongAnswerTextField2: UITextField!
    
    @IBOutlet weak var wrongAnswerTextField3: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
