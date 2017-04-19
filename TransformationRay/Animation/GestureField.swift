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
    
    
    static func singleTap(viewC:UIViewController){
        
        let vc = viewC as! ViewController
        
        for i in 0..<vc.tapGesture.numberOfTouches {
            
            vc.pointted = vc.tapGesture.location(ofTouch: i, in:viewC.view)
            
            if vc.pointted.y != 0.0 {
                vc.line.addLine(to:CGPoint(x: vc.pointted.x , y: vc.pointted.y))
            }
            
            vc.line.move(to: CGPoint(x: vc.pointted.x , y: vc.pointted.y))
            vc.count.append(vc.pointted)
            GestureField.labelSet(viewC: vc)
            
            if  GestureField.bool == true {
                TouchField.touchesMoved(vc.aTouch, with: vc.event, vw: vc.vw,pointted:vc.pointted)
            }
        }
    }
    
    static func labelSet(viewC:UIViewController){
        
        let vc = viewC as! ViewController
        vc.view.alpha = 1
        Animation().setShapeLayer(viewC:vc,bool:GestureField.bool)
        
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
