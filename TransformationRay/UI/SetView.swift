//
//  SetView.swift
//  TransformationRay
//
//  Created by 永田大祐 on 2017/04/17.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit

class SetView: UIView {
    
    var vw = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(vw)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func rectSet()-> CGRect{
        
        return CGRect(x:0,y:0,width:UIScreen.main.bounds.width/2,height:UIScreen.main.bounds.height)
    }
}
