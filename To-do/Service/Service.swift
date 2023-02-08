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
    
    static func fecthUser(id: String,completion: @escaping(User)->Void) {
        Firestore.firestore().collection("users").document(id).getDocument { snapshot, error in
            guard let data = snapshot?.data() else {return}
            let user = User(data: data)
            completion(user)
        }
    }
    
    static func fetchTask(completion: @escaping([Task])-> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        var tasks = [Task]()
        COLLECTION_TASKS.document(uid).collection("continue").order(by: "timestamp").addSnapshotListener { snaphot, error in
            snaphot?.documentChanges.forEach({ value in
                let data = value.document.data()
                tasks.append(Task(data: data))
                completion(tasks)
            })
        }
    }
}
