//
//  ViewController.swift
//  TransformationRay
//
//  Created by 永田大祐 on 2017/04/15.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIGestureRecognizerDelegate  {
    
    var tapGesture = UITapGestureRecognizer()
    var swipeLongGesture = UILongPressGestureRecognizer()
    var swipePinchGesture = UIPinchGestureRecognizer()
    var swipePanGesture = UIPanGestureRecognizer()
    var pointted = CGPoint()
    var line = UIBezierPath()
    var views = UIView()
    var vw = SetView().vw
    var lineWidth : CGFloat = 1
    var count : [CGPoint] = []
    var bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)
        
        swipeLongGesture = UILongPressGestureRecognizer(target: self, action:#selector(handleSwipeLong))
        self.view.addGestureRecognizer(swipeLongGesture)
        
        swipePinchGesture = UIPinchGestureRecognizer(target: self, action:#selector(zoomAction))
        self.view.addGestureRecognizer(swipePinchGesture)
        
        swipePanGesture = UIPanGestureRecognizer(target: self, action:#selector(panLabel))
        self.view.addGestureRecognizer(swipePanGesture)
        
    }
    
    func singleTap(){
        for i in 0..<tapGesture.numberOfTouches {
            pointted = tapGesture.location(ofTouch: i, in: self.view)
            
            if pointted.y != 0.0 {
                self.line.addLine(to:CGPoint(x: pointted.x , y: pointted.y))
            }
            self.line.move(to: CGPoint(x: pointted.x , y: pointted.y))
            count.append(pointted)
            self.view.addSubview(labelSet(label: views))
        }
    }
    
    func labelSet(label:UIView)->UIView{
        label.alpha = 1
        Animation().setShapeLayer(views:self,bool:bool)
        return label
    }
    
    func handleSwipeLong(sender: UILongPressGestureRecognizer){
        line.removeAllPoints()
        view.setNeedsLayout()
    }
    
    func zoomAction(sender: UIPinchGestureRecognizer) {
        
        view.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        
    }
    
    func panLabel(sender: UIPanGestureRecognizer) {
        if bool == true{
            let move:CGPoint = sender.translation(in: view)
            
            sender.view!.center.x += move.x
            sender.view!.center.y += move.y
            sender.setTranslation(CGPoint.zero, in:view)
        }
    }
    
    @IBAction func actionButton(_ sender: UIBarButtonItem) {
        if count.count > 2{
            self.line.move(to: CGPoint(x: count[count.endIndex-2].x , y:  count[count.endIndex-2].y))
            self.line.addLine(to:CGPoint(x: count[count.endIndex-1].x , y:count[count.endIndex-1].y))
            self.view.addSubview(labelSet(label: views))
        }
    }
    
    @IBAction func cirle(_ sender: UIBarButtonItem) {
        self.line = UIBezierPath(roundedRect: line.bounds, cornerRadius: line.bounds.width / 2)
        if bool == false{
            bool = true
        }else if bool == true{
            bool = false
        }
        self.view.addSubview(labelSet(label: views))
    }
    
    @IBAction func removeSegue(_ sender: UIBarButtonItem) {
        self.loadView()
        self.viewDidLoad()
    }
    
    @IBAction func boldly(_ sender: UIBarButtonItem) {
        lineWidth += 1
        
    }
    
    @IBAction func slender(_ sender: UIBarButtonItem) {
        lineWidth -= 1
    }
    
    @IBAction func transformImage(_ sender: UIBarButtonItem) {
        
        let image = ConversionImage().toImage(view: view)
        vw.frame =  SetView().rectSet()
        vw.image = image
        vw.layer.borderColor = UIColor.yellow.cgColor
        vw.layer.borderWidth = 2
        view.addSubview(vw)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.06,
            animations: { () -> Void in
                self.vw.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        })
        { (Bool) -> Void in
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        

        let aTouch: UITouch = touches.first!
        let location = aTouch.location(in: self.vw)
        

        let prevLocation = aTouch.previousLocation(in: self.vw)
        var myFrame: CGRect = self.vw.frame
        

        let deltaX: CGFloat = location.x - prevLocation.x
        let deltaY: CGFloat = location.y - prevLocation.y
        
        myFrame.origin.x += deltaX
        myFrame.origin.y += deltaY
        
        self.vw.frame = myFrame
        
    }
}

