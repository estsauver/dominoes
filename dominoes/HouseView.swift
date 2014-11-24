//
//  HouseView.swift
//  dominoes
//
//  Created by Earl J St Sauver on 11/23/14.
//  Copyright (c) 2014 Earl J St Sauver. All rights reserved.
//

import UIKit

class HouseView: UIView {
    
    var score: Int = 50 {
        willSet(newScore) {
            precondition(newScore <= 50, "A house can't have more than 50")
        }
        didSet {
            setNeedsDisplay()
        }
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    override func drawRect(rect: CGRect) {
        let width = bounds.width
        let height = bounds.height
        UIColor.blackColor().setStroke()
        var path: UIBezierPath
        if score >= 5 {
            drawLine(start: CGPoint(x: width / 2.0, y: 0),
                     end: CGPoint(x: width / 2.0, y: height))
        }
        if score >= 10 {
            drawLine(start: CGPoint(x: 0, y: height / 2.0),
                end: CGPoint(x: width, y: height / 2.0))
        }
        
//        TODO: - Figure out a more dry way to iterate across scores. 
        
//        let offsets = [(0,0), (width / 2.0, 0), (0, height / 2.0), (width / 2.0, height / 2.0)]
//        
//        for offset in offsets {
//            leftDiagonal(offset.0 , yOffset: offset.1, height: height, width: width)
//            rightDiagonal(offset.0, yOffset: offset.1, height: height, width: width)
//        }
        if score >= 15 {
           leftDiagonal(0, yOffset: 0, height: height, width: width)
        }
        
        if score >= 20 {
            rightDiagonal(0, yOffset: 0, height: height, width: width)
        }
        
        if score >= 25 {
            leftDiagonal(width / 2.0 , yOffset: 0, height: height, width: width)
        }
        
        if score >= 30 {
            rightDiagonal(width / 2.0, yOffset: 0, height: height, width: width)
        }
        
        if score >= 35 {
            leftDiagonal(0, yOffset: height/2.0, height: height, width: width)
        }
        
        if score >= 40 {
            rightDiagonal(0, yOffset: height / 2.0, height: height, width: width)
        }
        
        if score >= 45 {
            leftDiagonal(width / 2.0, yOffset: height / 2.0, height: height, width: width)
        }
        
        if score == 50 {
            rightDiagonal(width / 2.0, yOffset: height / 2.0, height: height, width: width)
        }
    }
    
    func drawLine(#start: CGPoint, end: CGPoint) {
        let path = UIBezierPath()
        path.lineWidth = 2
        path.lineCapStyle = kCGLineCapRound
        
        path.moveToPoint(start)
        path.addLineToPoint(end)
        path.stroke()
    }
    
    let dPadding = CGFloat(8.0)
    func leftDiagonal(xOffset: CGFloat, yOffset: CGFloat, height: CGFloat, width: CGFloat) {
        drawLine(start: CGPoint(x: xOffset + dPadding , y: yOffset + dPadding),
            end: CGPoint(x: xOffset + width / 2.0 - dPadding, y: yOffset + height / 2.0 - dPadding))
    }
    
    func rightDiagonal(xOffset: CGFloat, yOffset: CGFloat, height: CGFloat, width: CGFloat) {
        drawLine(start: CGPoint(x: xOffset + width / 2.0 - dPadding, y: yOffset + dPadding),
            end: CGPoint(x: xOffset + dPadding, y: yOffset + height / 2.0 - dPadding))
    }
    
    

}
