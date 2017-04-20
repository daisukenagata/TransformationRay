//
//  Animation.swift
//  TransformationRay
//
//  Created by 永田大祐 on 2017/04/15.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit

class Animation{
    
    var lineLayer = CAShapeLayer()
    var animation = CABasicAnimation(keyPath: "strokeEnd")
    
    
    func setShapeLayer(viewC:UIViewController,bool:Bool){
        
        _ =  shapeLayer(shape: lineLayer, viewC: viewC,bool:bool)
        _ =  animationDraw(animation: animation)
        viewC.view.layer.addSublayer(shapeLayer(shape: lineLayer, viewC: viewC,bool:bool))
        shapeLayer(shape: lineLayer,viewC: viewC,bool:bool).add(animation, forKey: nil)
        
    }
    
    func shapeLayer(shape:CAShapeLayer,viewC:UIViewController,bool:Bool)->CAShapeLayer{
        
        if GestureField.bool == false {
            
            shape.lineWidth = CommonStructure.lineWidth
            shape.strokeColor = UIColor.black.cgColor
            shape.fillRule = kCAFillRuleEvenOdd
            shape.path = CommonStructure.line.cgPath
            viewC.view.layer.addSublayer(shape)
            
        }
        
        return shape
        
    }
    
    func shapeLayer2(shape:CAShapeLayer,viewC:UIViewController,bool:Bool)->CAShapeLayer{
        
        shape.lineWidth = CommonStructure.lineWidth
        shape.strokeColor = UIColor.white.cgColor
        shape.fillRule = kCAFillRuleEvenOdd
        shape.path = CommonStructure.line.cgPath
        viewC.view.layer.addSublayer(shape)
        
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
