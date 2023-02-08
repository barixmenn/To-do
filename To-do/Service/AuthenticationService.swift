//
//  AuthenticationService.swift
//  To-do
//
//  Created by Baris on 6.02.2023.
//
import UIKit
import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage



struct AuthenticationViewModel {
    let emailText : String
    let passwordText : String
    let nameText : String
    let profileImage : UIImage
}

struct AuthenticationService {
    
    static func login(emailText: String, passwordText: String, completion: @escaping(AuthDataResult?, Error?)-> Void){
        Auth.auth().signIn(withEmail: emailText, password: passwordText,completion: completion)
    }
    
    static func createUser(user: AuthenticationViewModel, completion: @escaping(Error?)->Void){
        
        guard let profileImageData = user.profileImage.jpegData(compressionQuality: 0.5) else { return }
        let fileName = NSUUID().uuidString
        let reference = Storage.storage().reference(withPath: "images/profile_images/\(fileName)")
        reference.putData(profileImageData) { metaData, error in
            if let error = error{
                print("Error: \(error.localizedDescription)")
                return
            }
            reference.downloadURL { url, error in
                if let error = error{
                    print("Error: \(error.localizedDescription)")
                    return
                }
                guard let profileImageUrl = url?.absoluteString else{ return }
                Auth.auth().createUser(withEmail: user.emailText, password: user.passwordText) { result, error in
                    guard let uid = result?.user.uid else{ return }
                    let data = [
                        "email": user.emailText,
                        "name": user.nameText,
                        "profileImageUrl": profileImageUrl,
                        "uid": uid
                    ] as [String: Any]
                    Firestore.firestore().collection("users").document(uid).setData(data,completion: completion)
                }
            }
        }
        
    }
    
    
}
