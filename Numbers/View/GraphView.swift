//
//  GraphView.swift
//  Numbers
//
//  Created by stager on 25/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit

class GraphView: UIView {
    
    var numbers: [Double]!
    var colors: [UIColor]!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
       // let sort = numbers.sorted(by: {$0 < $1})
        let count = numbers.count
     
        let max:CGFloat = CGFloat(numbers.max()!)
        let min:CGFloat = CGFloat(numbers.min()!)
        guard let context = UIGraphicsGetCurrentContext() else {return}
        
        let topXOfGraph = rect.width * 0.1
        let topYOfGraph = rect.height * 0.1
        
        let bottomXOfGraph = rect.width - topXOfGraph
        let bottomYOfGraph = rect.height - topYOfGraph
        
        let midPointYOfGraph = (rect.height - 2 * topYOfGraph) / (abs(min) + abs(max)) * max + topYOfGraph
        
        //abciss
        let startPoint = CGPoint(x: topXOfGraph, y: topYOfGraph)
        let endPoint = CGPoint(x: topXOfGraph, y: bottomYOfGraph)
        
        context.move(to: startPoint)
        context.addLine(to: endPoint)
        
        //ordinat
        let midPoint = CGPoint(x:topXOfGraph, y:midPointYOfGraph)
        let midEndPoint = CGPoint(x: bottomXOfGraph, y: midPointYOfGraph)
        
        context.move(to: midPoint)
        context.addLine(to: midEndPoint)
        
        var index:CGFloat = 0
        let first = numbers[0]
        let partOfXRange = (rect.width - 2 * topXOfGraph) / CGFloat (count)
        let partOfYRangePositive = (midPointYOfGraph - topYOfGraph) / abs(max)
        let partOfYRangeNegative = (bottomYOfGraph - midPointYOfGraph) / abs(min)
        //numbers on ordinat
        UIGraphicsPushContext(context)
        let massive = [10, 20, 30, 40, 50, 60, 70, 80, 90]
        let sizeFont:CGFloat = 15
        let font = UIFont.systemFont(ofSize: sizeFont)
        
        for number in massive {
            if (CGFloat(number) > max) {continue}
            let string = NSAttributedString(string: String(number), attributes: [NSAttributedString.Key.font: font])
            let pointY = midPointYOfGraph - partOfYRangePositive * CGFloat(number)
            string.draw(at: CGPoint(x: topXOfGraph-1.5*sizeFont, y: pointY-0.8*sizeFont))
        }
        
        for number in massive {
            if (CGFloat(-number) < min) {continue}
            let string = NSAttributedString(string: String(-number), attributes: [NSAttributedString.Key.font: font])
            let pointY = midPointYOfGraph - partOfYRangePositive * CGFloat(-number)
            string.draw(at: CGPoint(x: topXOfGraph-2*sizeFont, y: pointY - sizeFont))
        }
        
        UIGraphicsPopContext()
        context.strokePath()
        var startY:CGFloat
        if (first > 0) {
            startY = midPointYOfGraph - partOfYRangePositive * CGFloat(first)
        }
        else {
            startY = midPointYOfGraph - partOfYRangeNegative * CGFloat(first)
        }
        
        var startLine = CGPoint(x: topXOfGraph, y: startY)
        
        for i in numbers {
            
            context.beginPath()
            context.setStrokeColor(colors![Int(index)].cgColor)
            context.move(to: startLine)
            let value: CGFloat = CGFloat(i)
            let xPoint = topXOfGraph + partOfXRange * index
            var yPoint: CGFloat
            if (value > 0) {
                yPoint = midPointYOfGraph - partOfYRangePositive * value
            }
            else {
                yPoint = midPointYOfGraph - partOfYRangeNegative * value
            }
            let nextPoint = CGPoint(x: xPoint, y: yPoint)
            index += 1
            context.addLine(to: nextPoint)
            startLine = nextPoint
            context.strokePath()
            
        }
        
        
    }
    
}
