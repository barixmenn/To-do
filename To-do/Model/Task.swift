//
//  Task.swift
//  To-do
//
//  Created by Baris on 8.02.2023.
//

import Foundation

import FirebaseFirestore
struct Task{
    let taskId: String
    let text: String
    let timestamp: Timestamp
    init(data: [String: Any]) {
        self.taskId = data["taskId"] as? String ?? ""
        self.text = data["text"] as? String ?? ""
        self.timestamp = data["timestamp"] as? Timestamp ?? Timestamp(date: Date())
    }
}
