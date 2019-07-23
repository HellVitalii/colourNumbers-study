//
//  textNumber.swift
//  Numbers
//
//  Created by stager on 16/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit

struct TextDouble{
    static let firstPosition = ["ноль","одна", "две", "три", "четыре", "пять", "шесть", "семь", "восемь", "девять"]
    static let secondPosition = ["двадцать", "тридцать", "сорок", "пятьдесят", "шестьдесят", "семьдесят", "восемьдесят", "девяносто"]
    static let secondPositionOnTen =  ["десять", "одиннадцать","двенадцать","тринадцать", "четырнадцать", "пятнадцать", "шестндцать", "семнадцать", "восемнадцать", "девятнадцать"]
    static let integerPlaces = [" целая"," целые"," целых"]
    static let decimalPlaces = [" десятая", " десятые"," десятых", " сотая", " сотые", " сотых"]
    
    
    
    static func getTextIntegerNumber(number:Int) -> String{
        
        var text:String = ""
        let fp = number % 10
        let sp = number / 10
        if (number >= 10) {
            if number < 20 {
                return secondPositionOnTen[fp]
            }
            else {
                if (fp != 0) {text = secondPosition[sp-2] + " " + firstPosition[fp]}
                else {text = secondPosition[sp-2]}
            }
        }
        else {
            return firstPosition[fp]
        }
        
        return text
    }
    static func getTextDoubleNumber(number:Double) -> String{
        
        var integer = Int(number)
        var decimal = Int(round(number.truncatingRemainder(dividingBy: 1)*100))
        
        var text:String = ""
        if (number < 0) {
            integer *= -1
            decimal *= -1
            text = "минус "
        }
        text += getTextIntegerNumber(number: integer)
        switch integer%10 {
        case 1:
            text += integerPlaces[0]
        case 2...4:
            text += integerPlaces[1]
        default:
            text += integerPlaces[2]
        }
        text += " " + getTextIntegerNumber(number: decimal)
        switch decimal%10 {
        case 0:
            switch decimal/10{
            case 1:
                text += decimalPlaces[0]
            case 2...4:
                text += decimalPlaces[1]
            default:
                text += decimalPlaces[2]
            }
        case 1:
            text += decimalPlaces[3]
        case 2...4:
            text += decimalPlaces[4]
        default:
            text += decimalPlaces[5]
        }        
        return text
    }
}
    

