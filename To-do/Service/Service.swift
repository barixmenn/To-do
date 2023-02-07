//
//  Service.swift
//  To-do
//
//  Created by Baris on 8.02.2023.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

struct Service {
    
    static func sendTask(text:String, completion: @escaping(Error?)-> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        let taskId = NSUUID().uuidString
        let data = [
            "text":text,
            "timestamp": Timestamp(date: Date()),
            "taskId": taskId
        ] as [String:Any]
        
        Firestore.firestore().collection("tasks").document(currentUid).collection("continue").document(taskId).setData(data,completion: completion)
    }
}