//
//  CellWithNumber.swift
//  Numbers
//
//  Created by stager on 15/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit

protocol CellWithNumberDelegate: class{
    func addToUserDefaults(sender: UITableViewCell)
    func deleteFromUserDefaults(sender: UITableViewCell)
}

class CellWithNumber: UITableViewCell {
    @IBOutlet weak var labelWithNumber: UILabel!
    @IBOutlet weak var labelWithText: UILabel!
    @IBOutlet weak var addSwitch: UISwitch!
    
    weak var delegate: CellWithNumberDelegate?
    
    @IBAction func addToUserDefaultsSwitch(_ sender: UISwitch) {
        if addSwitch.isOn == true {
            delegate?.addToUserDefaults(sender: self)
           
        }
        else {
            delegate?.deleteFromUserDefaults(sender: self)
            
        }
    }
    
    func configure(with formattedNumber:FormattedNumber){
        self.labelWithNumber.text = String(formattedNumber.number)
        self.labelWithNumber.textColor = formattedNumber.color
        self.labelWithText.text = formattedNumber.text
    }
}
