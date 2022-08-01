//
//  Ex+ViewController.swift
//  Constraint_Coding
//
//  Created by Islomjon on 01/08/22.
//

import Foundation
import UIKit

extension UIViewController{
    
    func showAlert(title:String, description:String){
        let alertVC = UIAlertController(title: title, message: description, preferredStyle: .actionSheet)
        let okBtn = UIAlertAction(title: "OK", style: .default)
        alertVC.addAction(okBtn)
        present(alertVC, animated: true)
    }
    
}
