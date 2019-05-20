//
//  TodoListViewModel.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 08/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

class TodoListViewModel: TodoListViewModeling {
    
    private var isCompleted = false
    
    //TODO: remove dynamic?
    private(set) var todos: Dynamic<[Todo]> = Dynamic<[Todo]>([])
    
    private let todoStorage: TodoStoraging
    
    init(todoStorage: TodoStoraging) {
        self.todoStorage = todoStorage
        
        todoStorage.getAll { todos in
            self.todos.value = todos
        }
    }
    
    func addTodo() {
        let randomPriority = Priority(rawValue: Int.random(in: 0...2))!
        
        let todo = Todo(
            id: UUID(),
            name: "Another Todo #\(todos.value.count)",
            priority: randomPriority,
            dueDate: Date(),
            creationDate: Date(),
            completedDate: isCompleted ? Date() : nil
        )
        
        todos.value.append(todo)
        todoStorage.add(todo: todo)
        
        isCompleted = !isCompleted
    }
    
    func removeTodo(at index: Int) {
        let todo = todos.value[index]
        todos.value.remove(at: index)
        todoStorage.remove(for: todo.id)
    }
}
