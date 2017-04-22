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
    var transMiller = CGAffineTransform()
    var transMiller2 = CGAffineTransform()
    var transMiller3 = CGAffineTransform()
    var transMiller4 = CGAffineTransform()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sample1.frame = CGRect(x:0,y:44,width:UIScreen.main.bounds.width/2,height:UIScreen.main.bounds.height/2-22)
        
        
        let angle =  180 * Double.pi / 180
        transMiller = CGAffineTransform(rotationAngle: CGFloat(angle));
        sample1.transform = transMiller
        self.view.addSubview(sample1)
        
        let angle2 =  270 * Double.pi / 180
        transMiller = CGAffineTransform(rotationAngle: CGFloat(angle2));
        sample2.transform = transMiller
        sample2.frame = CGRect(x:UIScreen.main.bounds.width/2,y:44,width:UIScreen.main.bounds.width/2,height:UIScreen.main.bounds.height/2-22)
        

        self.view.addSubview(sample2)
        
        let angle3 =  90 * Double.pi / 180
        transMiller = CGAffineTransform(rotationAngle: CGFloat(angle3));
        sample3.transform = transMiller
        sample3.frame = CGRect(x:0,y:UIScreen.main.bounds.height/2+22,width:UIScreen.main.bounds.width/2,height:UIScreen.main.bounds.height/2-22)
        self.view.addSubview(sample3)
        
        //        let angle4 =  180 * Double.pi / 180
        //        transMiller = CGAffineTransform(rotationAngle: CGFloat(angle4));
        //        sample4.transform = transMiller
        sample4.frame = CGRect(x:UIScreen.main.bounds.width/2,y:UIScreen.main.bounds.height/2+22,width:UIScreen.main.bounds.width/2,height:UIScreen.main.bounds.height/2-22)
        
        self.view.addSubview(sample4)
        
        
        CommonStructure.tapGesture = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        CommonStructure.tapGesture.delegate = self
        CommonStructure.tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        CommonStructure.tapGesture2.delegate = self
        CommonStructure.tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        CommonStructure.tapGesture3.delegate = self
        CommonStructure.tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        CommonStructure.tapGesture4.delegate = self

        self.sample1.addGestureRecognizer( CommonStructure.tapGesture)
        self.sample2.addGestureRecognizer( CommonStructure.tapGesture2)
        self.sample3.addGestureRecognizer( CommonStructure.tapGesture3)
        self.sample4.addGestureRecognizer( CommonStructure.tapGesture4)
        
    }
    
    func singleTap(){
        
        GestureField.singleTap2(viewC: sample1)
           
        
    }
    
}
