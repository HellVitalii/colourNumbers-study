//
//  FormattedNumbersStore.swift
//  Numbers
//
//  Created by stager on 23/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import Foundation

class FormattedNumbersStore: Codable {
    var numbers : [FormattedNumber]
    var loveNumbers: [FormattedNumber]? {
        didSet {
            saveFavoriteNumbers()
        }
    }
    
    var count: Int{
        return numbers.count
    }
    
    init() {
        self.numbers = [FormattedNumber]()
        loadFavoriteNumbers()
        if self.loveNumbers == nil {self.loveNumbers = []}
        self.numbers += self.loveNumbers!
        for _ in 0..<Int.random(in: 10..<50) {
            self.numbers.append(FormattedNumber.init())
        }
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
    
    func saveFavoriteNumbers() {
        let defaults = UserDefaults.standard
        let product = try? JSONEncoder().encode(loveNumbers!)
        defaults.set(product, forKey: "loveNumbers")
    }
    
    func loadFavoriteNumbers() {
        let defaults = UserDefaults.standard
        guard let newproduct = defaults.object(forKey: "loveNumbers") as? Data else { return }
        self.loveNumbers = try! JSONDecoder().decode([FormattedNumber].self, from: newproduct)
    }
    
}
