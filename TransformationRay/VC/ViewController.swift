//
//  ViewController.swift
//  TransformationRay
//
//  Created by 永田大祐 on 2017/04/15.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIGestureRecognizerDelegate  {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CommonStructure.tapGesture = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        CommonStructure.tapGesture.delegate = self
        self.view.addGestureRecognizer( CommonStructure.tapGesture)
        
        CommonStructure.tapLong = UILongPressGestureRecognizer(target: self, action:#selector(longTappled))
        self.view.addGestureRecognizer( CommonStructure.tapLong)
        
        CommonStructure.swipePinchGesture = UIPinchGestureRecognizer(target: self, action:#selector(zoomAction(sender:)))
        self.view.addGestureRecognizer( CommonStructure.swipePinchGesture)
        
        CommonStructure.swipePanGesture = UIPanGestureRecognizer(target: self, action:#selector(panLabel(sender:)))
        self.view.addGestureRecognizer( CommonStructure.swipePanGesture)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        LineField.lineField(line:CommonStructure.line, viewC: self)
        
    }
    
    func singleTap(){
        
        GestureField.singleTap(vc: self)
        
    }
    
    func labelSet(view:UIView)->UIView{
        
        GestureField.labelSet(viewC: self.view)
        
        return view
    }
    
    func zoomAction(sender: UIPinchGestureRecognizer) {
        
        GestureField.zoomAction(sender: sender, view: self.view)
        
    }
    
    func panLabel(sender: UIPanGestureRecognizer) {
        
        GestureField.panLabel(sender: sender, view: self.view)
        
    }
    
    func longTappled(sender: UILongPressGestureRecognizer) {
        
        CommonStructure.line.removeAllPoints()
        
    }
    
    @IBAction func actionBool(_ sender: UIBarButtonItem){
        
        if GestureField.bool == false {
            
            GestureField.bool = true
            
        } else if GestureField.bool == true {
            
            GestureField.bool = false
            
        }
        
    }
    
    @IBAction func actionButton(_ sender: UIBarButtonItem) {
        
        if  CommonStructure.count.count > 2{
            CommonStructure.line.move(to: CGPoint(x:  CommonStructure.count[ CommonStructure.count.endIndex-2].x,y:CommonStructure.count[ CommonStructure.count.endIndex-2].y))
            CommonStructure.line.addLine(to:CGPoint(x:  CommonStructure.count[CommonStructure.count.endIndex-1].x , y: CommonStructure.count[ CommonStructure.count.endIndex-1].y))
            self.view.addSubview(labelSet(view:  CommonStructure.views))
            
        }
        
    }
    
    @IBAction func cirle(_ sender: UIBarButtonItem) {
        
        CommonStructure.line = Mathematics.cirle()
        self.view.addSubview(labelSet(view: CommonStructure.views))
        
    }
    
    @IBAction func removeSegue(_ sender: UIBarButtonItem) {
        
        GestureField.bool = false
        LineField.lineField(line:CommonStructure.line, viewC: self)
        
    }
    
    @IBAction func transformImage(_ sender: UIBarButtonItem) {
        
        ConversionImage().toImage(viewC: self,uiImage:CommonStructure.vw)
        
    }
    
    @IBAction func eraserButton(_ sender: UIBarButtonItem) {
        
        Animation().shapeLayer2(shape: Animation().lineLayer,viewC: self.view,bool:GestureField.bool).add(Animation().animation, forKey: nil)
        
    }
    
    @IBAction func slender(_ sender: UIBarButtonItem) {
        
        CommonStructure.lineWidth -= 1
        
    }
    
    @IBAction func boldly(_ sender: UIBarButtonItem) {
        
        CommonStructure.lineWidth += 1
        
    }
    
}
