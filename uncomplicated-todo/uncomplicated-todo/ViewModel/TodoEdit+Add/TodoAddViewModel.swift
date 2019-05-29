//
//  TodoAddViewModel.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 28/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

class TodoAddViewModel: TodoEditViewModeling {
    
    let title: String = "Add Todo"
    let rightBarButtonTitle: String = "Add"
    let editedTodo: Todo? = nil
    
    private var name: String?
    private var dueDate: Date?
    private var priority: Priority?
    
    private let todoStorage: TodoStoraging

    init(todoStorage: TodoStoraging) {
        self.todoStorage = todoStorage
    }
    
    func rightBarButtonTapped() {
        //TODO: throw alert if some data in todo is not set
        guard let name = name,
            let priority = priority,
            let dueDate = dueDate
        else { return }
        
        let todo = Todo(id: UUID(),
                        name: name,
                        priority: priority,
                        dueDate: dueDate,
                        creationDate: Date(),
                        completedDate: nil)
        
        todoStorage.add(todo: todo)
    }
    
    func setName(_ name: String) {
        self.name = name
    }
    
    func setDueDate(_ date: Date) {
        self.dueDate = date
    }
    
    func setPriority(_ priority: Priority) {
        self.priority = priority
    }
    
    
}
