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
    var swipePinchGesture = UIPinchGestureRecognizer()
    var swipePanGesture = UIPanGestureRecognizer()
    var pointted = CGPoint()
    var line = UIBezierPath()
    var views = UIView()
    var vw = SetView().vw
    var lineWidth : CGFloat = 1
    var count : [CGPoint] = []
    var aTouch = Set<UITouch>()
    var event = UIEvent()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)
        
        swipePinchGesture = UIPinchGestureRecognizer(target: self, action:#selector(zoomAction(sender:)))
        self.view.addGestureRecognizer(swipePinchGesture)
        
        swipePanGesture = UIPanGestureRecognizer(target: self, action:#selector(panLabel(sender:)))
        self.view.addGestureRecognizer(swipePanGesture)
        
    }
    
    func singleTap(){
        
        GestureField.singleTap(viewC: self)
        
    }
    
    func labelSet(view:UIView)->UIView{
        
        GestureField.labelSet(viewC: self)
        
        return view
    }
    
    func zoomAction(sender: UIPinchGestureRecognizer) {
        
        GestureField.zoomAction(sender: sender, view: self.view)
        
    }
    
    func panLabel(sender: UIPanGestureRecognizer) {
        
        GestureField.panLabel(sender: sender, view: self.view)
        
    }
    
    @IBAction func actionBool(_ sender: UIBarButtonItem){
        
        GestureField.bool = true
        
    }

    @IBAction func actionButton(_ sender: UIBarButtonItem) {
        
        if count.count > 2{
            self.line.move(to: CGPoint(x: count[count.endIndex-2].x , y:  count[count.endIndex-2].y))
            self.line.addLine(to:CGPoint(x: count[count.endIndex-1].x , y:count[count.endIndex-1].y))
            self.view.addSubview(labelSet(view: views))
        }
        
    }
    
    @IBAction func cirle(_ sender: UIBarButtonItem) {
        
        self.line = UIBezierPath(roundedRect: line.bounds, cornerRadius: line.bounds.width / 2)
        self.view.addSubview(labelSet(view: views))
        
    }
    
    @IBAction func removeSegue(_ sender: UIBarButtonItem) {
        
        GestureField.bool = false
        self.loadView()
        self.viewDidLoad()
        line.removeAllPoints()
        view.setNeedsLayout()

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
}

