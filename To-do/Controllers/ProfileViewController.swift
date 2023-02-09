//
//  ProfileViewController.swift
//  To-do
//
//  Created by Baris on 6.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - Properties
    
    //MARK: - UI Elements
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.backgroundColor = .lightGray
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 150 / 2
        return imageView
    }()
  //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

//MARK: - Helpers
extension ProfileViewController {
    private func style() {
        backgroundGradientColor()
    }
    
    private func layout() {
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        ])
    }
}
