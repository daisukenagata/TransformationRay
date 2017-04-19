//
//  ConversionImage.swift
//  TransformationRay
//
//  Created by 永田大祐 on 2017/04/17.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit

class ConversionImage {
    
    func toImage(viewC:UIViewController,uiImage:UIImageView) {
        
        let vc = viewC as! ViewController
        
        UIGraphicsBeginImageContextWithOptions(vc.view.frame.size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0.0, y: 0.0)
        vc.view.layer.render(in: context!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        uiImage.frame =  SetView().rectSet()
        uiImage.image = image
        uiImage.layer.borderColor = UIColor.yellow.cgColor
        uiImage.layer.borderWidth = 2
        vc.view.addSubview(uiImage)

    }
}
