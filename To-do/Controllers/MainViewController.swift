//
//  MainViewController.swift
//  To-do
//
//  Created by Baris on 6.02.2023.
//

import UIKit
import FirebaseAuth

class MainViewController:UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        userStatus()
        //signOut()
    }
}

extension MainViewController {
    private func userStatus () {
        if Auth.auth().currentUser?.uid == nil {
            print("Kullanıcı yok")
            let navigation = LoginViewController()
            navigation.modalPresentationStyle = .fullScreen
            present(navigation, animated: true)
        } else {
            print("Kullanıcı var")
        }
    }
    private func signOut() {
        do {
            try Auth.auth().signOut()
        }catch {
            
        }
    }
}
