//
//  TodoStorage.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 27/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation
import CoreData

//TODO: implement network synchronization when server will be available
class TodoStorage: TodoStoraging {
    
    private let networkManager: NetworkManaging
    private let persistentStorage: TodoPersistentStoraging
    
    init(networkManager: NetworkManaging, persistentStorage: TodoPersistentStoraging) {
        self.networkManager = networkManager
        self.persistentStorage = persistentStorage
    }
    
    func add(todo: Todo) {
        persistentStorage.add(todo: todo)
    }
    
    func remove(for id: UUID) {
        persistentStorage.remove(for: id)
    }
    
    func getAll(completion: @escaping ([Todo]) -> Void) {
        persistentStorage.getAll(completion: completion)
    }
    
    func update(for id: UUID, name: String, priority: Priority, dueDate: Date?, creationDate: Date, completedDate: Date?) {
        persistentStorage.update(
            for: id,
            name: name,
            priority: priority,
            dueDate: dueDate,
            creationDate: creationDate,
            completedDate: completedDate
        )
    }
    
    func update(todo: Todo, with completedDate: Date?) {
        persistentStorage.update(for: todo.id,
                                 name: todo.name,
                                 priority: todo.priority,
                                 dueDate: todo.dueDate,
                                 creationDate: todo.creationDate,
                                 completedDate: completedDate)
    }
    
}
