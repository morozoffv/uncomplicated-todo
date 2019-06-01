//
//  TodoEditViewModel.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 28/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

class TodoEditViewModel: TodoEditViewModeling {
    
    let items: [TodoEditItem] = TodoEditItem.allCases
   
    let title: String = "Edit Todo"
    let rightBarButtonTitle: String = "Save"
    
    private(set) var name: String
    private(set) var dueDate: Date
    private(set) var priority: Priority
    
    private let editedTodo: Todo
    private let todoStorage: TodoStoraging

    init(todo: Todo, todoStorage: TodoStoraging) {
        self.editedTodo = todo
        self.name = todo.name
        self.dueDate = todo.dueDate
        self.priority = todo.priority
        self.todoStorage = todoStorage
    }
    
    func rightBarButtonTapped() {
        todoStorage.update(
            for: editedTodo.id,
            name: name,
            priority: priority,
            dueDate: dueDate,
            creationDate: editedTodo.creationDate,
            completedDate: editedTodo.completedDate)
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
