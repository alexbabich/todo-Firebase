//
//  TaskCellViewModel.swift
//  todo-Firebase
//
//  Created by alex-babich on 09.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import Foundation
import Combine


class TaskCellViewModel: ObservableObject, Identifiable {
    @Published var task: Task
    @Published var completionStateIconName = ""
    
    var id = ""
    private var cancellables = Set<AnyCancellable>()
    
    init(task: Task) {
        self.task = task
        
        $task.map { task in
            task.completed ? "checkmark.circle.fill" : "circle"
        }
        .assign(to: \.completionStateIconName, on: self)
        .store(in: &cancellables)
        
        $task.map { task in
            task.id
        }
        .assign(to: \.id, on: self)
        .store(in: &cancellables)
    }
}
