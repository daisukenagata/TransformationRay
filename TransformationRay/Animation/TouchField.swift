//
//  TouchField.swift
//  TransformationRay
//
//  Created by 永田大祐 on 2017/04/19.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit

struct TouchField {
    
    static func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?,vw:UIImageView,pointted:CGPoint) {
        
        vw.center = pointted
        
    }
    
}
