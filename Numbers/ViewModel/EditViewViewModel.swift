//
//  EditViewViewModel.swift
//  Numbers
//
//  Created by stager on 22/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import Foundation

class EditViewViewModel {
    var number: FormattedNumber
    
    init (number:FormattedNumber) {
        self.number = number
    }
    
    func value() -> String{
        return String(self.number.number)
    }
}
