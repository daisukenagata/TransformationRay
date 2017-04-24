//
//  GestureField.swift
//  TransformationRay
//
//  Created by 永田大祐 on 2017/04/19.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit

struct GestureField {
    
    static var bool = false
    
    
    static func singleTap(viewC:UIView){
        
        
        for i in 0..<CommonStructure.tapGesture.numberOfTouches {
            
            CommonStructure.pointted = CommonStructure.tapGesture.location(ofTouch: i, in:viewC)
            
            if CommonStructure.pointted.y != 0.0 {
                CommonStructure.line.addLine(to:CGPoint(x:CommonStructure.pointted.x , y:CommonStructure.pointted.y))
            }
            
            
            CommonStructure.line.move(to: CGPoint(x:CommonStructure.pointted.x , y:CommonStructure.pointted.y))
            CommonStructure.count.append(CommonStructure.pointted)
            GestureField.labelSet(viewC: viewC)
            
            
            if  GestureField.bool == true {
                
                TouchField.touchesMoved(CommonStructure.aTouch, with:CommonStructure.event, vw:CommonStructure.vw,pointted:CommonStructure.pointted)
                
            }
        }
    }
    
    
    static func singleTap2(view:UIView,index:Int){
        
        
        for i in 0..<TapGesture.tapGesture[index].numberOfTouches {
            
            CommonStructure.pointted = TapGesture.tapGesture[index].location(ofTouch: i, in:view)
            
            CommonStructure.angle = CGFloat(Mathematics.angle(a: CommonStructure.Point(x: 0, y: 0), b: CommonStructure.Point(x: CommonStructure.pointted.x, y: CommonStructure.pointted.y))) * Mathematics.angelMathematics
            
            if Mathematics.angleLength(p1: CommonStructure.Point(x:0,y:0), CommonStructure.Pointted(x:CommonStructure.pointted.x,y:CommonStructure.pointted.y)) > 0 {
                
                CommonStructure.line2 = UIBezierPath(arcCenter: CGPoint(x:0, y:0), radius: Mathematics.angleLength(p1: CommonStructure.Point(x:0,y:0), CommonStructure.Pointted(x:CommonStructure.pointted.x,y:CommonStructure.pointted.y)) , startAngle: 0, endAngle:CommonStructure.angle, clockwise: true)
                
            }else{
            
                CommonStructure.line2 = UIBezierPath(arcCenter: CGPoint(x:0, y:0), radius: -Mathematics.angleLength(p1: CommonStructure.Point(x:0,y:0), CommonStructure.Pointted(x:CommonStructure.pointted.x,y:CommonStructure.pointted.y)), startAngle: 0, endAngle:CommonStructure.angle, clockwise: true)
                
            }
            
            GestureField.labelSet3(viewC: view)
            
            CommonStructure.angle = 0.0
            CommonStructure.line2.removeAllPoints()
            
            
            CommonStructure.line.move(to:CGPoint(x:0 , y:0))
            CommonStructure.line.addLine(to: CGPoint(x:CommonStructure.pointted.x , y:CommonStructure.pointted.y))
            
            
            CommonStructure.line2.move(to:CGPoint(x:0 , y:0))
            CommonStructure.line2.addLine(to:CGPoint(x:0 , y:view.bounds.height))
            CommonStructure.line2.addLine(to:CGPoint(x:0 , y:-view.bounds.height))
            
            
            CommonStructure.line2.move(to:CGPoint(x:0 , y:0))
            CommonStructure.line2.addLine(to:CGPoint(x:view.bounds.width , y:0))
            CommonStructure.line2.addLine(to:CGPoint(x:-view.bounds.width , y:0))
            
            
            GestureField.labelSet(viewC: view)
            GestureField.labelSet3(viewC: view)
            
            
        }
    }
    
    static func singleTap3(view:UIView,cg:CGFloat){
                
        
        CommonStructure.line2 = UIBezierPath(arcCenter: CGPoint(x:view.bounds.width/2, y:view.bounds.height/2), radius: Mathematics.angleLength(p1: CommonStructure.Point(x:0,y:0), CommonStructure.Pointted(x:100,y:100)) , startAngle: 0, endAngle:cg  * Mathematics.angelMathematics, clockwise: true)
        
        GestureField.labelSet3(viewC: view)
        
        
        CommonStructure.line.move(to:CGPoint(x:view.bounds.width/2 , y:view.bounds.height/2))
        CommonStructure.line.addLine(to: CGPoint(x:Mathematics.Coordinate().0*100,y:Mathematics.Coordinate().1*100))
        
        
        CommonStructure.angle = 0.0
        CommonStructure.line2.removeAllPoints()
        

        CommonStructure.line2.move(to:CGPoint(x:view.bounds.width/2 , y:view.bounds.height/2))
        CommonStructure.line2.addLine(to:CGPoint(x:0 , y:view.bounds.height/2))
        
        
        CommonStructure.line2.move(to:CGPoint(x:view.bounds.width/2 , y:view.bounds.height/2))
        CommonStructure.line2.addLine(to:CGPoint(x:0 , y:view.bounds.height*100))
        
        
        CommonStructure.line2.move(to:CGPoint(x:view.bounds.width/2 , y:view.bounds.height/2))
        CommonStructure.line2.addLine(to:CGPoint(x:view.bounds.width/2 , y:0))
       
        
        CommonStructure.line2.move(to:CGPoint(x:view.bounds.width/2 , y:view.bounds.height/2))
        CommonStructure.line2.addLine(to:CGPoint(x:view.bounds.width*100 , y:0))
       
        
        GestureField.labelSet(viewC: view)
        GestureField.labelSet3(viewC: view)
        
        
    }
    

    static func labelSet(viewC:UIView){
        
        viewC.alpha = 1
        Animation().setShapeLayer(viewC:viewC,bool:GestureField.bool)
        
    }
    
    static func labelSet3(viewC:UIView){
        
        viewC.alpha = 1
        Animation().setShapeLayer3(viewC:viewC,bool:GestureField.bool)
        
    }
    
    static func zoomAction(sender: UIPinchGestureRecognizer,view:UIView) {
        
        view.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        
    }
    
    static func panLabel(sender: UIPanGestureRecognizer,view:UIView) {
        
        if GestureField.bool == true{
            let move:CGPoint = sender.translation(in: view)
            
            sender.view!.center.x += move.x
            sender.view!.center.y += move.y
            sender.setTranslation(CGPoint.zero, in:view)
            
        }
    }
}
