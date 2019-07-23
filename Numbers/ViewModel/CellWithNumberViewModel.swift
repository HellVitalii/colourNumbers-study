//
//  CellWithNumberViewModel.swift
//  Numbers
//
//  Created by stager on 19/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit

class CellWithNumberViewModel {
    let formattedNumber: FormattedNumber
    let favorite: Bool
    
    init(formattedNumber: FormattedNumber, favorite: Bool) {
        self.formattedNumber = formattedNumber
        self.favorite = favorite
    }
    
    func getFormattedNumber() -> FormattedNumber {
        return formattedNumber
    }
    /*func getNumber() -> Double {
        return formattedNumber.number
    }
    func getTextNumber() -> String {
        return formattedNumber.text
    }
    func getColor() -> UIColor {
        return formattedNumber.color
    }*/
    func getFavorite() -> Bool {
        return favorite
    }
}
