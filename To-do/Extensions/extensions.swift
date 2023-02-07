//
//  extensions.swift
//  To-do
//
//  Created by Baris on 4.02.2023.
//

import UIKit
import JGProgressHUD
extension UIViewController{
    func backgroundGradientColor(){
        view.layer.backgroundColor = UIColor(red: 0.571, green: 0.302, blue: 0.302, alpha: 1).cgColor
    }
    
    func showHud(show: Bool) {
        view.endEditing(true)
        let jgprogress = JGProgressHUD(style: .dark)
        jgprogress.textLabel.text = "Loading"
        jgprogress.detailTextLabel.text = "Please wait"
        
        if show {
            jgprogress.show(in: view)
        } else {
            jgprogress.dismiss(animated: true)
        }
    }
}
