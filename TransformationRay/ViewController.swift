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
    var swipeUpGesture = UISwipeGestureRecognizer()
    var swipeDownGesture = UISwipeGestureRecognizer()
    var pointted = CGPoint()
    var line = UIBezierPath()
    var views = UIView()
    var lineWidth : CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)
        
        swipeUpGesture = UISwipeGestureRecognizer(target: self, action:#selector(handleSwipeUp))
        swipeUpGesture.numberOfTouchesRequired = 1
        swipeUpGesture.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUpGesture)
        
        swipeDownGesture = UISwipeGestureRecognizer(target: self, action:#selector(handleSwipeDown))
        swipeDownGesture.numberOfTouchesRequired = 1
        swipeDownGesture.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDownGesture)

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

    func handleSwipeUp(sender: UITapGestureRecognizer){
        lineWidth += 1
    }
    
    func handleSwipeDown(sender: UITapGestureRecognizer){
        lineWidth -= 1
    }
}

