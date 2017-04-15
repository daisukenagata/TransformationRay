//
//  ViewController.swift
//  TransformationRay
//
//  Created by 永田大祐 on 2017/04/15.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController,UIGestureRecognizerDelegate  {

    var tapGesture = UITapGestureRecognizer()
    var pointted = CGPoint()
    var line = UIBezierPath()
    var lineLayer = CAShapeLayer()
    var views = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func singleTap() {

        for i in 0..<tapGesture.numberOfTouches {
            pointted = tapGesture.location(ofTouch: i, in: self.view)
            if pointted.y != 0.0 {
                self.line.addLine(to:CGPoint(x: pointted.x , y: pointted.y))
            }
            //MARK:tap
            self.line.move(to: CGPoint(x: pointted.x , y: pointted.y))
            self.view.addSubview(labelSet(label: views))
        }
    }
    func labelSet(label:UIView)->UIView{
        label.alpha = 1
        Animation().setShapeLayer(views:self)
        return label
    }
//    func setShapeLayer(){
//        _ =  shapeLayer(shape: lineLayer)
//        _ =  animationDraw(animation: animation)
//        self.view.layer.addSublayer(shapeLayer(shape: lineLayer))
//        shapeLayer(shape: lineLayer).add(animation, forKey: nil)
//    }
//    func shapeLayer(shape:CAShapeLayer)->CAShapeLayer{
//        shape.lineWidth = 8
//        shape.strokeColor = UIColor.black.cgColor
//        shape.fillRule = kCAFillRuleEvenOdd
//        shape.path = line.cgPath
//        self.view.layer.addSublayer(shape)
//        return shape
//    }
//    func animationDraw(animation:CABasicAnimation)->CABasicAnimation{
//        animation.duration = 1.0
//        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
//        animation.fromValue = 0.0
//        animation.toValue = 1.0
//        animation.fillMode = kCAFillModeForwards
//        animation.isRemovedOnCompletion = true
//        return animation
//    }
}

