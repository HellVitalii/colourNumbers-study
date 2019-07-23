//
//  AddingCellViewModel.swift
//  Numbers
//
//  Created by stager on 19/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit

class AddingCellViewModel {
    let number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func getNumber() -> Double {
        return number
    }
    
}
