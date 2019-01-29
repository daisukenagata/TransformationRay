//
//  AlertView.swift
//  TransformationRay
//
//  Created by 永田大祐 on 2017/04/22.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit


class AlertView {
    
    
    func alert(view:UIViewController)->String{
        
        let alertController = UIAlertController(title: "", message: "Angle input", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        let otherAction = UIAlertAction(title: "OK", style: .default) {
            action in
            alertController.addTextField { ( textFields : UITextField) -> Void in
                guard alertController.textFields?[0].text == "" else {
                    
                    CommonStructure.cg = Int((alertController.textFields?[0].text)!)!
                    view.navigationItem.title = alertController.textFields?[0].text?.description
                    GestureField.singleTap3(view: view.view, cg: CGFloat(Double((alertController.textFields?[0].text!)!)!))
                    
                    return
                }
            }
        }
        
        alertController.textFields?[0].keyboardType = .numberPad
        alertController.addAction(otherAction)
        view.present(alertController, animated: true, completion: nil)
        
        return (alertController.textFields?[0].text)!
    }
    
    func alert2(view:UIViewController,st:String){
        
        if  CommonStructure.bool == false {
            
            let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
            alertController.title = st
            
            let otherAction = UIAlertAction(title: "false", style: .default) {
                action in
                
            }
            
            let otherAction2 = UIAlertAction(title: "true", style: .default) {
                action in
                CommonStructure.bool = true
            }
            
            alertController.addAction(otherAction)
            alertController.addAction(otherAction2)
            view.present(alertController, animated: true, completion: nil)
            
        }
    }
}
