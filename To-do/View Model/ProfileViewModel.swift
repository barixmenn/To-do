//
//  ProfileViewModel.swift
//  To-do
//
//  Created by Baris on 9.02.2023.
//

import Foundation

struct ProfileViewModel{
    var profileString: String
    
    init(profileString: String) {
        self.profileString = profileString
    }
    
    var profileImageUrl: URL?{
        return URL(string: profileString)
    }
}
