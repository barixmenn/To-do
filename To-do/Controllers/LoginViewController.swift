//
//  ViewController.swift
//  To-do
//
//  Created by Baris on 4.02.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let logoImageView: UIImageView = {
           let imageView =  UIImageView()
           imageView.contentMode = .scaleAspectFill
           imageView.clipsToBounds = true
           imageView.image = UIImage(systemName: "checkmark.diamond")
        imageView.tintColor = .white
           return imageView
       }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        style()
        layout()
    }


}

extension LoginViewController {
    private func style(){
            logoImageView.translatesAutoresizingMaskIntoConstraints = false
            logoImageView.layer.cornerRadius = 150 / 2
        }
        private func layout(){
            view.addSubview(logoImageView)
            NSLayoutConstraint.activate([
                logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
                logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                logoImageView.widthAnchor.constraint(equalToConstant: 150),
                logoImageView.heightAnchor.constraint(equalToConstant: 150),
                
            ])
        }
}
