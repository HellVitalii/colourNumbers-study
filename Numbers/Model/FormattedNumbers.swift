//
//  FormattedNumbers.swift
//  Numbers
//
//  Created by stager on 15/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit
class FormattedNumber: Codable, Equatable{
    static func == (lhs: FormattedNumber, rhs: FormattedNumber) -> Bool {
        return lhs.color == rhs.color && lhs.number == rhs.number
    }
    
    
    var number: Double
    var color: UIColor
    var text: String{
        get{
            return TextDouble.getTextDoubleNumber(number: self.number)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case number
        case hue
        case saturation
        case brightness
        case alpha
    }
    
    init() {
       
        self.number = Double((round(Double.random(in: -99.99...99.99)*100))/100)
        self.color = UIColor.init(hue: CGFloat.random(in: 0..<1), saturation: 1, brightness: 1, alpha: 1)
        
    }
    
    init(number: Double){
        self.number = number
        self.color = UIColor.init(hue: CGFloat.random(in: 0..<1), saturation: 1, brightness: 1, alpha: 1)
    }
    
     required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.number = try container.decode(Double.self, forKey: .number)
        let hue = try container.decode(Double.self, forKey: .hue)
        let saturation = try container.decode(Double.self, forKey: .saturation)
        let brightness = try container.decode(Double.self, forKey: .brightness)
        let alpha = try container.decode(Double.self, forKey: .alpha)
        self.color = UIColor.init(hue: CGFloat.init(hue), saturation: CGFloat.init(saturation), brightness: CGFloat.init(brightness), alpha: CGFloat.init(alpha))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(number, forKey: .number)
        var hue = CGFloat()
        var saturation = CGFloat()
        var brightness = CGFloat()
        var alpha = CGFloat()
        color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        try container.encode(Double(hue), forKey: .hue)
        try container.encode(Double(saturation), forKey: .saturation)
        try container.encode(Double(brightness), forKey: .brightness)
        try container.encode(Double(alpha), forKey: .alpha)
        
    }
}


