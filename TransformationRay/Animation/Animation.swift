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

    
    func setShapeLayer(viewC:UIViewController,bool:Bool){
        
        let vc = viewC as! ViewController
        _ =  shapeLayer(shape: lineLayer, viewC: viewC,bool:bool)
        _ =  animationDraw(animation: animation)
        vc.view.layer.addSublayer(shapeLayer(shape: lineLayer, viewC: viewC,bool:bool))
        shapeLayer(shape: lineLayer,viewC: viewC,bool:bool).add(animation, forKey: nil)
        
    }
    
    func shapeLayer(shape:CAShapeLayer,viewC:UIViewController,bool:Bool)->CAShapeLayer{
        
        let vc = viewC as! ViewController
        shape.lineWidth = vc.lineWidth
        if bool == false {
        shape.strokeColor = UIColor.black.cgColor
        shape.fillRule = kCAFillRuleEvenOdd
        shape.path = vc.line.cgPath
        vc.view.layer.addSublayer(shape)
        }
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
