//
//  TouchField.swift
//  TransformationRay
//
//  Created by 永田大祐 on 2017/04/19.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit

struct TouchField {
//    
//    static func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?,vw:UIImageView) {
//        UIView.animate(withDuration: 0.06,
//                       animations: { () -> Void in
//                        vw.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
//        })
//        { (Bool) -> Void in }
//    }
    
    static func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?,vw:UIImageView,pointted:CGPoint) {
        
        vw.center = pointted
        
    }
    
}
