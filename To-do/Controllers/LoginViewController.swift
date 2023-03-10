//
//  ViewController.swift
//  To-do
//
//  Created by Baris on 4.02.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Properties
    private var viewModel = LoginViewModel()
    //MARK: - UI Elements
    private let logoImageView: UIImageView = {
        let imageView =  UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "sun.max")
        imageView.tintColor = .white
        return imageView
    }()
    private lazy var emailContainerView: UIView = {
        let containerView = AuthenticationInputView(image: UIImage(systemName: "envelope")!, textField: emailTextField)
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
    private let passwordTextField: UITextField = {
        let textField = CustomTextField(placeHolder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var loginButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        button.layer.cornerRadius = 7
        button.isEnabled = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var switchToRegistrationPage: UIButton = {
           let button = UIButton(type: .system)
           let attributedTitle = NSMutableAttributedString(string: "Click To Become A Member", attributes: [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 14)])
           button.setAttributedTitle(attributedTitle, for: .normal)
           button.addTarget(self, action: #selector(handleGoRegister), for: .touchUpInside)
           return button
       }()
    
    private var stackView = UIStackView ()
    
//MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        style()
        layout()
    }
    
    
}



//MARK: - Selector
extension LoginViewController{
    
    @objc private func handleLoginButton(_ sender: UIButton) {
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        showHud(show: true)
        AuthenticationService.login(emailText: email, passwordText: password) { data, error in
            if let error = error {
                print("Error:\(error.localizedDescription)")
                self.showHud(show: false)
                return
                
            }
            self.showHud(show: false)
            self.dismiss(animated: true)
        }
    }
    @objc private func handleTextField(_ sender: UITextField){
        
        if sender == emailTextField {
            viewModel.emailText = sender.text
        } else {
            viewModel.passwordText = sender.text
        }
        loginButtonStatus()
    }
    
    @objc private func handleGoRegister(_ sender: UIButton) {
        let navigation = RegisterViewController()
        navigation.modalPresentationStyle = .fullScreen
        present(navigation, animated: true)
    }
}



//MARK: - HELPERS
extension LoginViewController {
    private func loginButtonStatus(){
           if viewModel.status{
               loginButton.isEnabled = true
               loginButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
               loginButton.setTitleColor(.black, for: .normal)
           }else{
               loginButton.isEnabled = false
               loginButton.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
           }
       }
    private func style(){
        //backgroundGradientColor()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper")!)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        switchToRegistrationPage.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.layer.cornerRadius = 150 / 2
        
        stackView = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 14
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
         passwordTextField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
        
    }
    private func layout(){
        view.addSubview(logoImageView)
                view.addSubview(stackView)
                view.addSubview(switchToRegistrationPage)
                NSLayoutConstraint.activate([
                    logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
                    logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    logoImageView.widthAnchor.constraint(equalToConstant: 150),
                    logoImageView.heightAnchor.constraint(equalToConstant: 150),
                    
                    stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 32),
                    stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
                    view.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 32),
                    switchToRegistrationPage.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
                    switchToRegistrationPage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 32),
                    view.trailingAnchor.constraint(equalTo: switchToRegistrationPage.trailingAnchor, constant: 32)
                    
                   
                ])
    }
}
