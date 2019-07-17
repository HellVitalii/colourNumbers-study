//
//  FormattedNumbers.swift
//  Numbers
//
//  Created by stager on 15/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit
struct FormattedNumber{
    var number: Double
    var color: UIColor
    var text: String{
        get{
            return TextDouble.getTextDoubleNumber(number: self.number)
        }
    }
    
    init() {
       
        self.number = Double((round(Double.random(in: -99.99...99.99)*100))/100)
        self.color = UIColor.init(hue: CGFloat.random(in: 0..<1), saturation: 1, brightness: 1, alpha: 1)
        
    }
    
    init(number: Double){
        self.number = number
        self.color = UIColor.init(hue: CGFloat.random(in: 0..<1), saturation: 1, brightness: 1, alpha: 1)
    }
}

class FormattedNumbersStore {
    var numbers : [FormattedNumber]
    var count: Int{
        return numbers.count
    }
    
    init() {
        self.numbers = [FormattedNumber]()
    }
    
    init(count:Int) {
        
        self.numbers = [FormattedNumber]()
        for _ in 0..<count {
            self.numbers.append(FormattedNumber.init())
        }
        
    }
    subscript(index: Int) -> FormattedNumber {
        get{
            return self.numbers[index]
        }
        set{
            self.numbers[index] = newValue
        }
    }
    
}
