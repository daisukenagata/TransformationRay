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
    
    func setShapeLayer(viewC:UIView,bool:Bool){
        
        _ =  shapeLayer(shape: lineLayer, viewC: viewC,bool:bool)
        _ =  animationDraw(animation: animation)
        viewC.layer.addSublayer(shapeLayer(shape: lineLayer, viewC: viewC,bool:bool))
        shapeLayer(shape: lineLayer,viewC: viewC,bool:bool).add(animation, forKey: nil)
        
    }
    
    func setShapeLayer3(viewC:UIView,bool:Bool){
        
        _ =  shapeLayer3(shape: lineLayer, viewC: viewC,bool:bool)
        _ =  animationDraw(animation: animation)
        lineLayer.fillColor = UIColor.clear.cgColor
        viewC.layer.addSublayer(shapeLayer3(shape: lineLayer, viewC: viewC,bool:bool))
        shapeLayer3(shape: lineLayer,viewC: viewC,bool:bool).add(animation, forKey: nil)
        
    }

    func shapeLayer(shape:CAShapeLayer,viewC:UIView,bool:Bool)->CAShapeLayer{
        
        if GestureField.bool == false {
            
            shape.lineWidth = CommonStructure.Unit().lineWidth
            shape.strokeColor = UIColor.black.cgColor
            shape.fillRule = CAShapeLayerFillRule.evenOdd
            shape.path = CommonStructure.line.cgPath
            viewC.layer.addSublayer(shape)
            
        }
        
        return shape
        
    }
    
    func shapeLayer2(shape:CAShapeLayer,viewC:UIView,bool:Bool)->CAShapeLayer{
        
        shape.lineWidth = CommonStructure.Unit().lineWidth
        shape.strokeColor = UIColor.white.cgColor
        shape.fillRule = CAShapeLayerFillRule.evenOdd
        shape.path = CommonStructure.line.cgPath
        viewC.layer.addSublayer(shape)
        
        return shape
        
    }
    
    func shapeLayer3(shape:CAShapeLayer,viewC:UIView,bool:Bool)->CAShapeLayer{
        
        shape.lineWidth = CommonStructure.Unit().lineWidth
        shape.strokeColor = UIColor.black.cgColor
        shape.fillRule = CAShapeLayerFillRule.nonZero
        shape.path = CommonStructure.line2.cgPath
        viewC.layer.addSublayer(shape)
        
        return shape
        
    }

    func animationDraw(animation:CABasicAnimation)->CABasicAnimation{
        
        animation.duration = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = true
        
        return animation
        
    }

}
