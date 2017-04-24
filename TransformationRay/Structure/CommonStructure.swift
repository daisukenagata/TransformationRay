//
//  CommonStructure.swift
//  TransformationRay
//
//  Created by 永田大祐 on 2017/04/20.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit

struct CommonStructure {
    
    static var tapGesture = UITapGestureRecognizer()
    static var swipePinchGesture = UIPinchGestureRecognizer()
    static var swipePanGesture = UIPanGestureRecognizer()
    static var tapLong = UILongPressGestureRecognizer()
    static var pointted = CGPoint()
    static var line = UIBezierPath()
    static var line2 = UIBezierPath()
    static var views = UIView()
    static var vw = SetView().vw
    static var transMiller = CGAffineTransform()
    static var count : [CGPoint] = []
    static var cg = Int()
    static var angle = CGFloat()
    static var lineWidth : CGFloat = 1

    struct Unit {
        
        var lineWidth : CGFloat = 1
        var aTouch = Set<UITouch>()
        var event = UIEvent()
        
    }
    
    struct Point {
        
        var x:CGFloat = 0
        var y:CGFloat = 0
    }
    
    struct Pointted {
        
        var x = CommonStructure.pointted.x
        var y = CommonStructure.pointted.y
    }
    
}

class TapGesture{
    
    static var tapGesture1 = UITapGestureRecognizer()
    static var tapGesture2 = UITapGestureRecognizer()
    static var tapGesture3 = UITapGestureRecognizer()
    static var tapGesture4 = UITapGestureRecognizer()
    
    static var tapGesture : [UITapGestureRecognizer] = [TapGesture.tapGesture1,TapGesture.tapGesture2,TapGesture.tapGesture3,TapGesture.tapGesture4]
    
}
