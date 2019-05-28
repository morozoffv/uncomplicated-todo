//
//  TodoStorageMock.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 21/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

class TodoStorageMock: TodoStoraging {
    
    private let todos: [Todo]
    
    init(todos: [Todo]) {
        self.todos = todos
    }
    
    func add(todo: Todo) {
        
    }
    
    func remove(for id: UUID) {
        
    }
    
    func update(for id: UUID, name: String, priority: Priority, dueDate: Date?, creationDate: Date, completedDate: Date?) {

    }
    
    func update(todo: Todo, with completedDate: Date?) {
        
    }
    
    func getAll(completion: @escaping ([Todo]) -> Void) {
        completion(todos)
    }
}
