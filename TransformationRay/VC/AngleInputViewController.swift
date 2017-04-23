//
//  AngleInputViewController.swift
//  TransformationRay
//
//  Created by 永田大祐 on 2017/04/23.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit

class AngleInputViewController: UIViewController {
    
    var alert = AlertView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let anglePi =  180 * Double.pi / 180
        CommonStructure.transMiller = CGAffineTransform(rotationAngle: CGFloat(anglePi))
        view.transform = CommonStructure.transMiller
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        LineField.lineField(line:CommonStructure.line, viewC: self)
        
    }
    
    @IBAction func Angleinput(_ sender: UIBarButtonItem) {
        
        self.navigationItem.title = alert.Alert(view: self)

    }
    
}
