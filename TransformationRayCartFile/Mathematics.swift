//
//  Mathematics.swift
//  TransformationRay
//
//  Created by 永田大祐 on 2017/04/23.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit

struct Mathematics {
    
    static let angelMathematics = CGFloat(Double.pi/180.0)
    
    //MARK:Angle
    
    static func angle(a:CommonStructure.Point, b:CommonStructure.Point) -> Double {
        
        var r = atan2(b.y - a.y, b.x - a.x)
        if r < 0 {
            r = r + CGFloat(2 * Double.pi)
        }
        return floor(Double(r * 360 / CGFloat(2 * Double.pi)))
    }
    
    //MARK:AngleLength
    
    static func angleLength( p1: CommonStructure.Point, _ p2: CommonStructure.Pointted) -> CGFloat {
        
        return sqrt(pow(p1.x - p2.x, 2) + pow(p1.y - p2.y, 2))
        
    }
    
    //MARK:Coordinate
    
    static func Coordinate()->(Double,Double){
        
        let radian : Double = Double(CommonStructure.cg) * Double.pi / 180
        
        return(sin(radian)*1000,cos(radian)*1000)
        
    }
    
    //MARK:Distance
    
    static func distance(a:CommonStructure.Point, b:CommonStructure.Point) -> Double {
        
        return sqrt(Double(pow(b.x - a.x, 2) + pow(b.y - a.y, 2)))
        
    }
    
}