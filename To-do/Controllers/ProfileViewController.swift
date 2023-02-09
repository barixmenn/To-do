//
//  ProfileViewController.swift
//  To-do
//
//  Created by Baris on 6.02.2023.
//

import UIKit
import SDWebImage
class ProfileViewController: UIViewController {
    
    //MARK: - Properties
    var user: User? {
        didSet { configure() }
    }
    
    //MARK: - UI Elements
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 150 / 2
        imageView.layer.borderWidth = 2
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
    
    private func configure() {
        guard let user = user else {return}
        let viewModel = ProfileViewModel(profileString: user.profileImageUrl)
        imageView.sd_setImage(with: viewModel.profileImageUrl)
        
    }
}
