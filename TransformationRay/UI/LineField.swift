//
//  LineField.swift
//  TransformationRay
//
//  Created by 永田大祐 on 2017/04/20.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit

struct LineField {
    
    static func lineField(line:UIBezierPath,viewC:UIViewController){
        
        let vc = viewC as! ViewController
        
        vc.loadView()
        vc.viewDidLoad()
        line.removeAllPoints()
        vc.view.setNeedsLayout()
        
    }
}
