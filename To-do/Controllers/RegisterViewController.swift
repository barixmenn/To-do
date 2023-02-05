//
//  RegisterViewController.swift
//  To-do
//
//  Created by Baris on 5.02.2023.
//

import UIKit

class RegisterViewController : UIViewController {
    //MARK: - Properties
    private var viewModel = RegisterViewModel()
    //MARK: - UI Elements
    private let cameraButton : UIButton = {
        let camera = UIButton(type: .system)
        camera.setImage(UIImage(systemName: "camera.circle"), for: .normal)
        camera.tintColor = .white
        camera.contentVerticalAlignment = .fill
        camera.contentHorizontalAlignment = .fill
        return camera
    }()
    
    private lazy var emailContainerView: UIView = {
        let containerView = AuthenticationInputView(image: UIImage(systemName: "envelope")!, textField: emailTextField)
        return containerView
    }()
    private lazy var nameContainerView: UIView = {
        let containerView = AuthenticationInputView(image: UIImage(systemName: "person")!, textField: nameTextField)
        return containerView
    }()
    private lazy var usernameContainerView: UIView = {
        let containerView = AuthenticationInputView(image: UIImage(systemName: "person")!, textField: usernameTextField)
        return containerView
    }()
    private lazy var passwordContainerView: UIView = {
        let containerView = AuthenticationInputView(image: UIImage(systemName: "lock")!, textField: passwordTextField)
        
        return containerView
    }()
    private let emailTextField: UITextField = {
        let textField = CustomTextField(placeHolder: "Email")
        return textField
    }()
    private let nameTextField: UITextField = {
        let textField = CustomTextField(placeHolder: "Name")
        return textField
    }()
    private let usernameTextField: UITextField = {
        let textField = CustomTextField(placeHolder: "Username")
        return textField
    }()
    private let passwordTextField: UITextField = {
        let textField = CustomTextField(placeHolder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    private lazy var registerButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        button.layer.cornerRadius = 7
        button.isEnabled = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //button.addTarget(self, action: #selector(handleRegisterButton), for: .touchUpInside)
        return button
    }()
    private var stackView = UIStackView()
    private lazy var switchToLoginPage: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "If you are a member, Login Page", attributes: [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 14)])
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleGoLogin), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    
}


//MARK: - Selector
extension RegisterViewController {
    @objc private func handleTextField(_ sender: UITextField){
           if sender == emailTextField{
               viewModel.emailText = sender.text
           }else if sender == passwordTextField{
               viewModel.passwordText = sender.text
           }else if sender == nameTextField{
               viewModel.nameText = sender.text
           }else{
               viewModel.usernameText = sender.text
           }
           registerButtonStatus()
       }
    
    @objc private func handleGoLogin(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

//MARK: - Helpers
extension RegisterViewController {
    private func registerButtonStatus(){
         if viewModel.status{
             registerButton.isEnabled = true
             registerButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
             registerButton.setTitleColor(UIColor.black, for: .normal)
         }else{
             registerButton.isEnabled = false
             registerButton.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
         }
     }
    private func style() {
        view.layer.backgroundColor = UIColor(red: 0.571, green: 0.302, blue: 0.302, alpha: 1).cgColor
        self.navigationController?.navigationBar.isHidden = true
        
        
        stackView = UIStackView(arrangedSubviews: [emailContainerView,nameContainerView,usernameContainerView, passwordContainerView, registerButton])
        stackView.axis = .vertical
        stackView.spacing = 14
        stackView.distribution = .fillEqually
        
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        switchToLoginPage.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
        nameTextField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
        usernameTextField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
        
    }
    
    
    private func layout() {
        view.addSubview(cameraButton)
        view.addSubview(stackView)
        view.addSubview(switchToLoginPage)
        
        NSLayoutConstraint.activate([
            cameraButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            cameraButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cameraButton.widthAnchor.constraint(equalToConstant: 150),
            cameraButton.heightAnchor.constraint(equalToConstant: 150),
            
            stackView.topAnchor.constraint(equalTo: cameraButton.bottomAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            view.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 32),
            
            switchToLoginPage.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
            switchToLoginPage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 32),
            view.trailingAnchor.constraint(equalTo: switchToLoginPage.trailingAnchor, constant: 32)
        ])
    }
}

