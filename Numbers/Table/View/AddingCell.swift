//
//  AddingCell.swift
//  Numbers
//
//  Created by stager on 16/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit

protocol  AddingCellDelegate: class {
    func addData(number: Double)
}
class AddingCell: UITableViewCell {
    @IBOutlet weak var numberTF: UITextField!
    
    weak var delegate: AddingCellDelegate?
    
    @IBAction func tableButtonPressed() {
        
        guard let newNumber = Double(numberTF.text!) else {return}
        delegate?.addData(number: newNumber)
    }
}
