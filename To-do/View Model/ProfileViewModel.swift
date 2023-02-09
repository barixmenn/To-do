//
//  ProfileViewModel.swift
//  To-do
//
//  Created by Baris on 9.02.2023.
//

import Foundation
struct ProfileViewModel{
    var user: User
    init(user: User) {
        self.user = user
    }
    var profileImageUrl: URL?{
        return URL(string: user.profileImageUrl)
    }
    var name: String?{
        return user.name
    }
 
    var email: String?{
        return user.email
    }
}
