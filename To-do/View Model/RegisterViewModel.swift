//
//  RegisterViewModel.swift
//  To-do
//
//  Created by Baris on 5.02.2023.
//

import Foundation

struct RegisterViewModel {
    var emailText: String?
    var passwordText: String?
    var nameText: String?
    var usernameText : String?
    
    
    var status : Bool {
        return emailText?.isEmpty == false && passwordText?.isEmpty == false && nameText?.isEmpty == false && usernameText?.isEmpty == false
    }
}
