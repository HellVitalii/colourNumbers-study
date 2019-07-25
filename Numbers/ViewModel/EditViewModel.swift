//
//  EditViewViewModel.swift
//  Numbers
//
//  Created by stager on 22/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import Foundation

protocol EditViewModelDelegate: class {
    func performChange(number: Double)
}

class EditViewModel {
    var number: Double
    
    weak var coordinator: EditViewModelDelegate?
    
    init (number: Double) {
        self.number = number
    }
    
    func value() -> String{
        return String(self.number)
    }
    
    func save(number: Double) {
        coordinator?.performChange(number: number)
    }
    
}
