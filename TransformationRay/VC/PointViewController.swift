//
//  PointViewController.swift
//  TransformationRay
//
//  Created by 永田大祐 on 2017/04/21.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit

class PointViewController: UIViewController,UIGestureRecognizerDelegate {
    
    @IBOutlet weak var sample1: UIView!
    @IBOutlet weak var sample2: UIView!
    @IBOutlet weak var sample3: UIView!
    @IBOutlet weak var sample4: UIView!
    @IBOutlet weak var anglePoint: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //MARK: sample1
        sample1.frame = CGRect(x:0,y:44,width:UIScreen.main.bounds.width/2,height:UIScreen.main.bounds.height/2-22)
        let angle =  180 * Double.pi / 180
        CommonStructure.transMiller = CGAffineTransform(rotationAngle: CGFloat(angle));
        sample1.transform = CommonStructure.transMiller
        self.view.addSubview(sample1)
        
        //MARK: sample2
        let angle2 =  270 * Double.pi / 180
        CommonStructure.transMiller = CGAffineTransform(rotationAngle: CGFloat(angle2));
        sample2.transform = CommonStructure.transMiller
        sample2.frame = CGRect(x:UIScreen.main.bounds.width/2,y:44,width:UIScreen.main.bounds.width/2,height:UIScreen.main.bounds.height/2-22)
        self.view.addSubview(sample2)
        
        //MARK: sample3
        let angle3 =  90 * Double.pi / 180
        CommonStructure.transMiller = CGAffineTransform(rotationAngle: CGFloat(angle3));
        sample3.transform = CommonStructure.transMiller
        sample3.frame = CGRect(x:0,y:UIScreen.main.bounds.height/2+22,width:UIScreen.main.bounds.width/2,height:UIScreen.main.bounds.height/2-22)
        self.view.addSubview(sample3)
        
        //MARK: sample4
        sample4.frame = CGRect(x:UIScreen.main.bounds.width/2,y:UIScreen.main.bounds.height/2+22,width:UIScreen.main.bounds.width/2,height:UIScreen.main.bounds.height/2-22)
        self.view.addSubview(sample4)
        
        
        for i  in 0...TapGesture.tapGesture.count {
            
            if self.sample1.tag == i {
                
                TapGesture.tapGesture[i] = UITapGestureRecognizer(target: self, action: #selector(singleTap1))
                TapGesture.tapGesture[i].delegate = self
                self.sample1.addGestureRecognizer(TapGesture.tapGesture[i])
                
            }
            
            if self.sample2.tag == i {
                
                TapGesture.tapGesture[i] = UITapGestureRecognizer(target: self, action: #selector(singleTap2))
                TapGesture.tapGesture[i].delegate = self
                self.sample2.addGestureRecognizer(TapGesture.tapGesture[i])
                
            }
            
            if self.sample3.tag == i {
                
                TapGesture.tapGesture[i] = UITapGestureRecognizer(target: self, action: #selector(singleTap3))
                TapGesture.tapGesture[i].delegate = self
                self.sample3.addGestureRecognizer(TapGesture.tapGesture[i])
                
            }
            
            if self.sample4.tag == i {
                
                TapGesture.tapGesture[i] = UITapGestureRecognizer(target: self, action: #selector(singleTap4))
                TapGesture.tapGesture[i].delegate = self
                self.sample4.addGestureRecognizer(TapGesture.tapGesture[i])
                
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        LineField.lineField(line:CommonStructure.line, viewC: self)
        
    }
    

    func singleTap1(){
        GestureField.singleTap2(view:sample1,vc:self,index:sample1.tag)
       
        anglePoint.title = Mathematics.angle(a: CommonStructure.Point(x: 0, y: 0), b: CommonStructure.Point(x: (CommonStructure.pointted.x), y: (CommonStructure.pointted.y))).description
        
    }
    func singleTap2(){
        GestureField.singleTap2(view:sample1,vc:self,index:sample2.tag)
        
        anglePoint.title = Mathematics.angle(a: CommonStructure.Point(x: 0, y: 0), b: CommonStructure.Point(x: (CommonStructure.pointted.x), y: (CommonStructure.pointted.y))).description
    }
    func singleTap3(){
        GestureField.singleTap2(view:sample1,vc:self,index:sample3.tag)
        
        anglePoint.title = Mathematics.angle(a: CommonStructure.Point(x: 0, y: 0), b: CommonStructure.Point(x: (CommonStructure.pointted.x), y: (CommonStructure.pointted.y))).description
    }
    func singleTap4(){
        GestureField.singleTap2(view:sample1,vc:self,index:sample4.tag)
        
        anglePoint.title = Mathematics.angle(a: CommonStructure.Point(x: 0, y: 0), b: CommonStructure.Point(x: (CommonStructure.pointted.x), y: (CommonStructure.pointted.y))).description

    }
    
}
