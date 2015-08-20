//
//  Rainbow.swift
//  test_IBInspectable
//
//  Created by Cyrilshanway on 2015/8/20.
//  Copyright (c) 2015年 Cyrilshanway. All rights reserved.
//

import UIKit

//obj_c IB_DESIGNABLE
@IBDesignable

class Rainbow: UIView {

    @IBInspectable var firstColor: UIColor = UIColor(red: (37.0/255.0), green: (252.0/255), blue: (244.0/255.0), alpha: 1.0)
    @IBInspectable var secondColor: UIColor = UIColor(red: (171.0/255.0), green: (250.0/255), blue: (81.0/255.0), alpha: 1.0)
    @IBInspectable var thirdColor: UIColor = UIColor(red: (238.0/255.0), green: (32.0/255), blue: (53.0/255.0), alpha: 1.0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addOval(lineWidth: CGFloat, path: CGPathRef, strokeStart: CGFloat, strokeEnd: CGFloat, strokeColor: UIColor, fillColor: UIColor, shadowRadius: CGFloat, shadowOpacity: Float, shadowOffset: CGSize) {
        
        let arc = CAShapeLayer()
        arc.lineWidth = lineWidth
        arc.path = path
        arc.strokeStart = strokeStart
        arc.strokeEnd = strokeEnd
        arc.strokeColor = strokeColor.CGColor
        arc.fillColor = fillColor.CGColor
        arc.shadowRadius = shadowRadius
        arc.shadowOpacity = shadowOpacity
        arc.shadowOffset = shadowOffset
        layer.addSublayer(arc)
    }
    
    override func drawRect(rect: CGRect) {
        // 添加圆弧
        addCircle(80, capRadius: 20, color: firstColor)
        addCircle(150, capRadius: 20, color: secondColor)
        addCircle(215, capRadius: 20, color: thirdColor)
    }
    
    func addCircle(arcRadius: CGFloat, capRadius: CGFloat, color: UIColor) {
        let x = CGRectGetMidX(bounds)
        let y = CGRectGetMidY(bounds)
        
        // 底部圆弧
        let pathBottom = UIBezierPath(ovalInRect: CGRectMake((x - (arcRadius/2)),
            (y - (arcRadius/2)), arcRadius, arcRadius)).CGPath
        addOval(20.0, path: pathBottom, strokeStart: 0, strokeEnd: 0.5,
            strokeColor: color, fillColor: UIColor.clearColor(),
            shadowRadius: 0, shadowOpacity: 0, shadowOffset: CGSizeZero)
        
        // 中间圆弧
        let pathMiddle = UIBezierPath(ovalInRect: CGRectMake((x - (capRadius/2)) - (arcRadius/2),
            (y - (capRadius/2)), capRadius, capRadius)).CGPath
        addOval(0.0, path: pathMiddle, strokeStart: 0, strokeEnd: 1.0,
            strokeColor: color, fillColor: color,
            shadowRadius: 5.0, shadowOpacity: 0.5, shadowOffset: CGSizeZero)
        
        // 顶部圆弧
        let pathTop = UIBezierPath(ovalInRect: CGRectMake((x - (arcRadius/2)),
            (y - (arcRadius/2)), arcRadius, arcRadius)).CGPath
        addOval(20.0, path: pathTop, strokeStart: 0.5, strokeEnd: 1.0,
            strokeColor: color, fillColor: UIColor.clearColor(),
            shadowRadius: 0, shadowOpacity: 0, shadowOffset: CGSizeZero)
    }
}
