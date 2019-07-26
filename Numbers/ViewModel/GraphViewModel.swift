//
//  GraphViewModel.swift
//  Numbers
//
//  Created by stager on 25/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit

class GraphViewModel {
    
    var dataWithColorNumbers: FormattedNumbersStore!
    weak var coordinator: GraphCoordinator?
    
    
    
    func addDataToGraph() -> [Double] {
        var numbers = [Double]()
        for i in dataWithColorNumbers.numbers{
            numbers.append(i.number)
        }
        return numbers
    }
    
    func addColorToGraph() -> [UIColor] {
        var colors = [UIColor]()
        for i in dataWithColorNumbers.numbers{
            colors.append(i.color)
        }
        return colors
    }
    
    func mean() -> String? {
        var mean: Double = 0
        for i in dataWithColorNumbers.numbers {
            mean += i.number
        }
        let count = dataWithColorNumbers.numbers.count
        mean /= Double(count)
        return String(format: "Mean = %.2f", mean)
    }
    
    func minimum() -> String? {
        let sort = dataWithColorNumbers.numbers.sorted(by: {$0.number < $1.number})
        return "Minimum = \(sort[0].number)"
    }
    
    func maximum() -> String? {
        let sort = dataWithColorNumbers.numbers.sorted(by: {$0.number > $1.number})
        return "Maximum = \(sort[0].number)"
    }
}

