//
//  Task.swift
//  todo-Firebase
//
//  Created by alex-babich on 09.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


struct Task: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var completed: Bool
    @ServerTimestamp var createdTime: Timestamp?
    var userId: String?
}

//#if DEBUG
//let testDataTasks = [
//    Task(title: "some taks 1", completed: true),
//    Task(title: "some taks 2", completed: true),
//    Task(title: "some taks 3", completed: false),
//    Task(title: "some taks 4", completed: true)
//]
//#endif
