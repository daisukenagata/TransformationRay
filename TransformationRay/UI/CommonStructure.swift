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
    static var views = UIView()
    static var lineWidth : CGFloat = 1
    static var count : [CGPoint] = []
    static var aTouch = Set<UITouch>()
    static var event = UIEvent()
    static var vw = SetView().vw
    
}
