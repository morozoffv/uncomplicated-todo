//
//  TodoAddViewModel.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 28/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

class TodoAddViewModel: TodoEditViewModeling {
    
    let items: [TodoEditItem] = TodoEditItem.allCases
    
    let title: String = "Add Todo"
    let rightBarButtonTitle: String = "Add"
    let editedTodo: Todo? = nil
    
    private(set) var name: String = ""
    private(set) var dueDate: Date = Date()
    private(set) var priority: Priority = .high
    
    private let todoStorage: TodoStoraging

    init(todoStorage: TodoStoraging) {
        self.todoStorage = todoStorage
    }
    
    func rightBarButtonTapped() {
        //TODO: disable button if some data is not set
        guard !name.isEmpty else { return }
        
        let todo = Todo(id: UUID(),
                        name: name,
                        priority: priority,
                        dueDate: dueDate,
                        creationDate: Date(),
                        completedDate: nil)
        
        todoStorage.add(todo: todo)
    }
    
    func setName(_ name: String) {
        self.name = name.trimmingCharacters(in: .whitespacesAndNewlines)
        print(self.name)
    }
    
    func setDueDate(_ date: Date) {
        self.dueDate = date
        print(self.dueDate)
    }
    
    func setPriority(_ priority: Priority) {
        self.priority = priority
        print(self.priority)
    }
}
