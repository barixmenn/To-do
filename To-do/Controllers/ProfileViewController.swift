//
//  ProfileViewController.swift
//  To-do
//
//  Created by Baris on 6.02.2023.
//


import UIKit
import SDWebImage
import FirebaseAuth
class ProfileViewController: UIViewController {
    // MARK: - Properties
    var user: User?{
        didSet{ configure() }
    }
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var nameContainer: CustomProfileView = {
        let customProfileView = CustomProfileView(label: nameLabel)
        return customProfileView
    }()
    private let nameLabel = UILabel()
    
    private lazy var emailContainer: CustomProfileView = {
        let customProfileView = CustomProfileView(label: emailLabel)
        return customProfileView
    }()
    private let emailLabel = UILabel()
        private lazy var signOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Out", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .mainColor
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleSignOutButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    private var stackView = UIStackView()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
 // MARK: - Selector
extension ProfileViewController{
   @objc private func handleSignOutButton(){
        do{
            try Auth.auth().signOut()
            DispatchQueue.main.async {
                let controller = UINavigationController(rootViewController: LoginViewController())
                controller.modalPresentationStyle = .fullScreen
                self.present(controller, animated: true)
            }
        }catch{
            
        }
        
    }
}
// MARK: - Helpers
extension ProfileViewController{
    private func style(){
        backgroundGradientColor()
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.layer.cornerRadius = 160 / 2
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.borderWidth = 3
        
        stackView = UIStackView(arrangedSubviews: [emailContainer, nameContainer, signOutButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    private func layout(){
        view.addSubview(profileImageView)
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileImageView.heightAnchor.constraint(equalToConstant: 160),
            profileImageView.widthAnchor.constraint(equalToConstant: 160),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            view.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 32),
            
        ])
    }
    private func attributedTitle(title: String, info:String)-> NSMutableAttributedString{
        let attributedTitle = NSMutableAttributedString(string: "\(title): ",attributes: [.foregroundColor: UIColor.white, .font: UIFont.preferredFont(forTextStyle: .title2)])
        attributedTitle.append(NSAttributedString(string: info, attributes: [.foregroundColor: UIColor.white, .font: UIFont.preferredFont(forTextStyle: .title3)]))
        return attributedTitle
    }
    private func configure(){
        guard let user = self.user else { return }
        let viewModel = ProfileViewModel(user: user)
        profileImageView.sd_setImage(with: viewModel.profileImageUrl)
        self.nameLabel.attributedText = attributedTitle(title: "Name", info: viewModel.name!)
        self.emailLabel.attributedText = attributedTitle(title: "Email", info: viewModel.email!)
    }
}
