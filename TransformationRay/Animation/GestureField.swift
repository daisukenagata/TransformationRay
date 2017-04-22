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
            
            CommonStructure.line.move(to:CGPoint(x:0 , y:0))
            CommonStructure.line2.move(to:CGPoint(x:0 , y:0))

            CommonStructure.line2.addLine(to:CGPoint(x:0 , y:view.bounds.height))
            CommonStructure.line2.addLine(to:CGPoint(x:view.bounds.width , y:0))
            
            
            CommonStructure.line.addLine(to: CGPoint(x:CommonStructure.pointted.x , y:CommonStructure.pointted.y))
            CommonStructure.count.append(CommonStructure.pointted)
    
            GestureField.labelSet(viewC: view)
            
            if  GestureField.bool == true {
                TouchField.touchesMoved(CommonStructure.aTouch, with:CommonStructure.event, vw:CommonStructure.vw,pointted:CommonStructure.pointted)
            }
        }
        
        struct Point {
            var x:Double = 0
            var y:Double = 0
        }
        
        func angle(a:Point, b:Point) -> Double {
            var r = atan2(b.y - a.y, b.x - a.x)
            if r < 0 {
                r = r + 2 * Double.pi
            }
            return floor(r * 360 / (2 * Double.pi))
        }
        
        
        print(angle(a: Point(x: 0, y: 0), b: Point(x: Double(CommonStructure.pointted.x), y: Double(CommonStructure.pointted.y))),"角度")
        
    }
    
    
    static func labelSet(viewC:UIView){
        
        viewC.alpha = 1
        Animation().setShapeLayer(viewC:viewC,bool:GestureField.bool)
        
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
