//
//  AlertView.swift
//  TransformationRay
//
//  Created by 永田大祐 on 2017/04/22.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit

protocol AlertViewDelegatae:class {
    func Alert(view:UIViewController)
}

class AlertView:UIView,AlertViewDelegatae{
   
    var delegate:AlertViewDelegatae?
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.delegate = self
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func Alert(view:UIViewController){

        let alertController = UIAlertController(title: "", message: "Angle input", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        let otherAction = UIAlertAction(title: "OK", style: .default) {
            action in
            alertController.addTextField { ( textFields : UITextField) -> Void in
                guard alertController.textFields?[0].text == "" else {
                    GestureField.singleTap2(view: self, index: view.view.tag)
                   return 
                }
            }
        }
        alertController.textFields?[0].keyboardType = .numberPad
        alertController.addAction(otherAction)
        view.present(alertController, animated: true, completion: nil)
        
    }
    
}
