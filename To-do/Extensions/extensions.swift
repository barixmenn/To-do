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
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemCyan.cgColor, UIColor.systemMint.cgColor]
        gradient.locations = [0,1]
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
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
