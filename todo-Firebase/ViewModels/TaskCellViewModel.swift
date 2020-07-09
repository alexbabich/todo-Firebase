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
    @Published var taskRepository = TaskRepository()
    
    var id = ""
    private var cancellables = Set<AnyCancellable>()
    
    init(task: Task) {
        self.task = task
        
        $task
            .map { task in
                task.completed ? "checkmark.circle.fill" : "circle"
            }
            .assign(to: \.completionStateIconName, on: self)
            .store(in: &cancellables)
        
        $task
            .compactMap { task in
                task.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
        
        $task
            .dropFirst()
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .sink { task in
                self.taskRepository.updateTask(task)
            }
            .store(in: &cancellables)
    }
}
