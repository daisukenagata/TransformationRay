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
    
    static func coordinate()->(Double,Double){
        
        let radian : Double = Double(CommonStructure.cg) * Double.pi / 180
        
        return(sin(radian)*1000,cos(radian)*1000)
        
    }
    
    //MARK:Distance
    
    static func distance(a:CommonStructure.Point, b:CommonStructure.Point) -> Double {
        
        return sqrt(Double(pow(b.x - a.x, 2) + pow(b.y - a.y, 2)))
        
    }
    
    //MARK:AngleMathematics
    
    static func mathematics() -> String{
        
        return  Mathematics.angle(a: CommonStructure.Point(x: 0, y: 0), b: CommonStructure.Point(x: (CommonStructure.pointted.x), y: (CommonStructure.pointted.y))).description
    }
    
    //MARK: Cirle
    
    static func cirle()->UIBezierPath{
        
        return UIBezierPath(roundedRect:CommonStructure.line.bounds, cornerRadius:CommonStructure.line.bounds.width / 2)
        
    }
    
    //MARK: Tap
    
    static func mathematicsTap(vc:UIViewController) {
        
        if GestureField.bool2 == true {
            
            let ddd = CommonStructure.DefalutsSave().k.object(forKey: "dx") as! CGFloat
            let nnn = CommonStructure.DefalutsSave().k.object(forKey: "dy") as! CGFloat
            
            GestureField.bool2 = false
            
            
            CommonStructure.alert.alert2(view:vc,st: "Distance"+Mathematics.distance(a: CommonStructure.Point(x: ddd , y: nnn), b: CommonStructure.Point(x: CommonStructure.pointted.x, y: CommonStructure.pointted.y)).description)

        }
        
        if GestureField.bool2 == false {
            
            CommonStructure.DefalutsSave().k.set(CGPoint(x:CommonStructure.pointted.x, y: CommonStructure.pointted.y).x, forKey: "dx")
            CommonStructure.DefalutsSave().k.set(CGPoint(x:CommonStructure.pointted.x, y: CommonStructure.pointted.y).y, forKey: "dy")
            GestureField.bool2 = true
            
        }
        
        if  GestureField.bool == true {
            
            TouchField.touchesMoved(CommonStructure.Unit().aTouch, with:CommonStructure.Unit().event, vw:CommonStructure.vw,pointted:CommonStructure.pointted)
            
        }
        
    }
    
    //MARK: MathematicsAngle
    
    static func mathematicsAngle()->CGFloat{
        
        return CGFloat(Mathematics.angle(a: CommonStructure.Point(x: 0, y: 0), b: CommonStructure.Point(x: CommonStructure.pointted.x, y: CommonStructure.pointted.y))) * Mathematics.angelMathematics
        
    }
    
    //MARK: MathematicsAngle
    
    static func mathematicsLength()->String{
        
        return Mathematics.angleLength(p1: CommonStructure.Point(x:0,y:0), CommonStructure.Pointted(x:CommonStructure.pointted.x , y:CommonStructure.pointted.y)).description
        
    }
    
    //MARK: MathematicsCirle
    
    static func mathematicsCirle()->UIBezierPath{

        if Mathematics.angleLength(p1: CommonStructure.Point(x:0,y:0), CommonStructure.Pointted(x:CommonStructure.pointted.x,y:CommonStructure.pointted.y)) > 0 {
            
         return UIBezierPath(arcCenter: CGPoint(x:0, y:0), radius: Mathematics.angleLength(p1: CommonStructure.Point(x:0,y:0), CommonStructure.Pointted(x:CommonStructure.pointted.x,y:CommonStructure.pointted.y)) , startAngle: 0, endAngle:Mathematics.mathematicsAngle(), clockwise: true)
            
        }else{
            
        return UIBezierPath(arcCenter: CGPoint(x:0, y:0), radius: -Mathematics.angleLength(p1: CommonStructure.Point(x:0,y:0), CommonStructure.Pointted(x:CommonStructure.pointted.x,y:CommonStructure.pointted.y)), startAngle: 0, endAngle:Mathematics.mathematicsAngle(), clockwise: true)
            
        }
    }
    
    //MARK: MathematicsCirle_100
    
    static func mathematicsCirle_100(view:UIView,cg:CGFloat)->UIBezierPath{

        return UIBezierPath(arcCenter: CGPoint(x:view.bounds.width/2, y:view.bounds.height/2), radius: Mathematics.angleLength(p1: CommonStructure.Point(x:0,y:0), CommonStructure.Pointted(x:100,y:100)) , startAngle: 0, endAngle:cg  * Mathematics.angelMathematics, clockwise: true)
    }
}
