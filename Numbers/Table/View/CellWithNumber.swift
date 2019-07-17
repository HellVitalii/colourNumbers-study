//
//  CellWithNumber.swift
//  Numbers
//
//  Created by stager on 15/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit

class CellWithNumber: UITableViewCell {
    @IBOutlet weak var labelWithNumber: UILabel!
    @IBOutlet weak var labelWithText: UILabel!
    
    func configure(with formattedNumber:FormattedNumber){
        self.labelWithNumber.text = String(formattedNumber.number)
        self.labelWithNumber.textColor = formattedNumber.color
        self.labelWithText.text = formattedNumber.text
    }
}
