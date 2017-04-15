//
//  Animation.swift
//  TransformationRay
//
//  Created by 永田大祐 on 2017/04/15.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit

class Animation:UIView {

    var lineLayer = CAShapeLayer()
    var animation = CABasicAnimation(keyPath: "strokeEnd")
    
    func setShapeLayer(views:ViewController){
        _ =  shapeLayer(shape: lineLayer, views: views)
        _ =  animationDraw(animation: animation)
        views.view.layer.addSublayer(shapeLayer(shape: lineLayer, views: views))
        shapeLayer(shape: lineLayer,views: views).add(animation, forKey: nil)
    }
    
    func shapeLayer(shape:CAShapeLayer,views:ViewController)->CAShapeLayer{
        shape.lineWidth = 8
        shape.strokeColor = UIColor.black.cgColor
        shape.fillRule = kCAFillRuleEvenOdd
        shape.path = views.line.cgPath
        views.view.layer.addSublayer(shape)
        return shape
    }
    
    func animationDraw(animation:CABasicAnimation)->CABasicAnimation{
        animation.duration = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = true
        return animation
    }

}
