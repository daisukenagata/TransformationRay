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
        
        viewC.loadView()
        viewC.viewDidLoad()
        line.removeAllPoints()
        viewC.view.setNeedsLayout()
        viewC.navigationItem.title = ""
        GestureField.bool2 = false
        CommonStructure.DefalutsSave().k.removeObject(forKey: "dx")
        CommonStructure.DefalutsSave().k.removeObject(forKey: "dy")
        
    }
}
