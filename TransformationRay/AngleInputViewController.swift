//
//  AngleInputViewController.swift
//  TransformationRay
//
//  Created by 永田大祐 on 2017/04/23.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit

class AngleInputViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CommonStructure.transMiller = CGAffineTransform(rotationAngle: CGFloat(180 * Double.pi / 180))
        view.transform = CommonStructure.transMiller
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)

        LineField.lineField(line:CommonStructure.line, viewC: self)
       
    }
    
    @IBAction func Angleinput(_ sender: UIBarButtonItem) {
        
        self.navigationItem.title = CommonStructure.alert.alert(view: self) 
        
    }
      
}
