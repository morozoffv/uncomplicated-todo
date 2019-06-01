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
    let editedTodo: Todo?
    
    private var name: String
    private var dueDate: Date
    private var priority: Priority
    
    private let todoStorage: TodoStoraging
    
    init(todo: Todo, todoStorage: TodoStoraging) {
        self.editedTodo = todo
        self.name = todo.name
        self.dueDate = todo.dueDate
        self.priority = todo.priority
        self.todoStorage = todoStorage
    }
    
    func rightBarButtonTapped() {
        guard let todo = editedTodo else { return }
        
        todoStorage.update(
            for: todo.id,
            name: name,
            priority: priority,
            dueDate: dueDate,
            creationDate: todo.creationDate,
            completedDate: todo.completedDate)
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
