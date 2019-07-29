//
//  GraphView.swift
//  Numbers
//
//  Created by stager on 25/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit

class GraphView: UIView {
    
    var numbers: [Double]?
    var colors: [UIColor]?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let numbers = self.numbers, let colors = self.colors, let context = UIGraphicsGetCurrentContext() else {
            return
        }
       
       // let sort = numbers.sorted(by: {$0 < $1})
        let count = numbers.count
     
        let max:CGFloat = CGFloat(numbers.max()!)
        let min:CGFloat = CGFloat(numbers.min()!)
        
        
        let topXOfGraph = rect.width * 0.1
        let topYOfGraph = rect.height * 0.1
        
        let bottomXOfGraph = rect.width - topXOfGraph
        let bottomYOfGraph = rect.height - topYOfGraph
        
        let midPointYOfGraph = (rect.height - 2 * topYOfGraph) / (abs(min) + abs(max)) * abs(max) + topYOfGraph
       
        //abciss
        let startPointOfX = CGPoint(x: topXOfGraph, y: topYOfGraph)
        let endPoint = CGPoint(x: topXOfGraph, y: bottomYOfGraph)
        
        context.move(to: startPointOfX)
        context.addLine(to: endPoint)
        
        //ordinat
        let midPoint = CGPoint(x:topXOfGraph, y:midPointYOfGraph)
        let midEndPoint = CGPoint(x: bottomXOfGraph, y: midPointYOfGraph)
        
        context.move(to: midPoint)
        context.addLine(to: midEndPoint)
        
        var index = 1
        var first = CGFloat(numbers[0])
        let partOfXRange = (rect.width - 2 * topXOfGraph) / CGFloat (count)
        let partOfYRangePositive = (midPointYOfGraph - topYOfGraph) / abs(max)
        let partOfYRangeNegative = (bottomYOfGraph - midPointYOfGraph) / abs(min)
        //numbers on ordinat
        UIGraphicsPushContext(context)
        let massive = [10, 20, 30, 40, 50, 60, 70, 80, 90]
        let sizeFont:CGFloat = 15
        let font = UIFont.systemFont(ofSize: sizeFont)
        
        for number in massive {
            if (CGFloat(number) > max) {
                continue
            }
            let string = NSAttributedString(string: String(number), attributes: [NSAttributedString.Key.font: font])
            let pointY = midPointYOfGraph - partOfYRangePositive * CGFloat(number)
            string.draw(at: CGPoint(x: topXOfGraph-1.5*sizeFont, y: pointY-0.8*sizeFont))
        }
        
        for number in massive {
            if (CGFloat(-number) < min) {continue}
            let string = NSAttributedString(string: String(-number), attributes: [NSAttributedString.Key.font: font])
            let pointY = midPointYOfGraph - partOfYRangeNegative * CGFloat(-number)
            string.draw(at: CGPoint(x: topXOfGraph-2*sizeFont, y: pointY - sizeFont))
        }
        
        UIGraphicsPopContext()
        context.strokePath()
        let startY:CGFloat
        if (first > 0) {
            startY = midPointYOfGraph - partOfYRangePositive * first
        }
        else {
            startY = midPointYOfGraph - partOfYRangeNegative * first
        }
        var startPoint = CGPoint(x: topXOfGraph, y: startY)
        
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        var colorForPath = [CGColor]()
        let path = UIBezierPath()
        path.move(to: midPoint)
        path.addLine(to: startPoint)
        colorForPath.append(colors[0].cgColor)
        
        
        while (index < count) {
            context.saveGState()
            while (index < numbers.count) {
                
                let value: CGFloat = CGFloat(numbers[index])
                let xPoint = topXOfGraph + partOfXRange * CGFloat(index)
                colorForPath.append(colors[index].cgColor)
                var yPoint: CGFloat
                if (value > 0) {
                    yPoint = midPointYOfGraph - partOfYRangePositive * value
                }
                else {
                    yPoint = midPointYOfGraph - partOfYRangeNegative * value
                }
                let nextPoint = CGPoint(x: xPoint, y: yPoint)
                
                if (((first > 0 && value>0) || (first < 0 && value<0)) ) {

                    path.addLine(to: nextPoint)
                    startPoint = nextPoint
                    
                    index += 1
                }
                else {
                    
                    first = value
                    let rightValue = startPoint.x * ( midPoint.y - yPoint )
                    let leftValue = xPoint * ( midPoint.y - startPoint.y )
                    startPoint.x = (leftValue - rightValue) / (yPoint - startPoint.y)
                    startPoint.y = midPoint.y
                    path.addLine(to: startPoint)
                    break
                }

            }

            path.close()
            path.addClip()
            let colorsForPath = colorForPath as CFArray
            let gr = CGGradient(colorsSpace: colorSpace, colors: colorsForPath, locations: nil)
            context.drawLinearGradient(gr!, start: midPoint, end: midEndPoint, options: [])
            path.stroke()
            context.restoreGState()
            //colorForPath.removeAll()
            //path.removeAllPoints()
            path.move(to: startPoint)
            //context.strokePath()
        }
        
        
    }
    
}
