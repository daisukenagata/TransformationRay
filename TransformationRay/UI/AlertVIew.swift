//
//  AlertView.swift
//  TransformationRay
//
//  Created by 永田大祐 on 2017/04/22.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit

class AlertView:UIView{
    
    
    func Alert(view:UIViewController)->String{
        
        let alertController = UIAlertController(title: "", message: "Angle input", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        let otherAction = UIAlertAction(title: "OK", style: .default) {
            action in
            alertController.addTextField { ( textFields : UITextField) -> Void in
                guard alertController.textFields?[0].text == "" else {
                   return 
                }
            }
        }
        alertController.textFields?[0].keyboardType = .numberPad
        alertController.addAction(otherAction)
        view.present(alertController, animated: true, completion: nil)
        
        return (alertController.textFields?[0].text)!
    }
}
