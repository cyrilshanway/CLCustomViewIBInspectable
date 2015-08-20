//
//  SquareView.swift
//  test_IBInspectable
//
//  Created by Cyrilshanway on 2015/8/20.
//  Copyright (c) 2015年 Cyrilshanway. All rights reserved.
//

import UIKit

@IBDesignable

class SquareView: UIView {

    @IBInspectable var borderColor: UIColor = UIColor.blueColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }
    
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        // Get the Graphics Context
        var context = UIGraphicsGetCurrentContext()
        
        // Set the outerline width
        CGContextSetLineWidth(context, 20.0)
        
        //CGContextSetLineWidth(context, lineWidth)
        
        // Set the outerline colour
        UIColor.blueColor().set()
        
        // Create square
        CGContextAddRect(context, rect)
        
        // Draw
        CGContextStrokePath(context)
    }
}
