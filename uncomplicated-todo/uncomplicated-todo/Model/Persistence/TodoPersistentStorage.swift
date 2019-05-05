//
//  TodoPersistentStorage.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 04/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation
import CoreData

enum TodoPersistentStorageError: Error {
    case transformationError
}

//TODO: add errors
class TodoPersistentStorage: TodoPersistentStoraging {
    
    private let coreDataStack: CoreDataStack
    
    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }
    
    func add(todo: Todo) {
        coreDataStack.storeContainer.performBackgroundTask { context in
            todo.toPersistentTodoAndAdd(to: context)
            
            do {
                try context.save()
            } catch {
                //TODO: put an error
                fatalError("Failure to save context: \(error)")
            }
        }
    }
    
    func remove(for id: UUID) {
        coreDataStack.storeContainer.performBackgroundTask { context in
            let fetchRequest: NSFetchRequest<TodoPersistent> = TodoPersistent.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %@", id.uuidString)
            
            //TODO: put an error
            guard
                let matches = try? context.fetch(fetchRequest),
                let object = matches.first
            else { return }
            
            context.delete(object)
            
            do {
                try context.save()
            } catch {
                //TODO: put an error
                fatalError("Failure to save context: \(error)")
            }
        }
    }
    
    func getAll(completion: @escaping ([Todo]) -> Void) {
        coreDataStack.storeContainer.performBackgroundTask { context in
            guard let persistentTodos = try? context.fetch(TodoPersistent.fetchRequest()),
                let todos = persistentTodos as? [TodoPersistent]
            else {
                completion([])
                return
            }
    
            completion(todos.mapTodos())
        }
    }
    
    func update(for id: UUID, name: String, priority: Priority, dueDate: Date?, creationDate: Date, completedDate: Date?) {
        coreDataStack.storeContainer.performBackgroundTask { context in
            let fetchRequest: NSFetchRequest<TodoPersistent> = TodoPersistent.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %@", id.uuidString)
            
            //TODO: put an error
            guard
                let matches = try? context.fetch(fetchRequest),
                let object = matches.first
                else { return }
            
            object.name = name
            object.priority = Int16(priority.rawValue)
            object.dueDate = dueDate
            object.creationDate = creationDate
            object.completedDate = completedDate
            
            do {
                try context.save()
            } catch {
                //TODO: put an error
                fatalError("Failure to save context: \(error)")
            }
        }
    }    
}

//TODO: add tests
extension TodoPersistent {
    func toTodo() throws -> Todo {
        guard
            let id = id,
            let name = name,
            let priority = Priority(rawValue: Int(priority)),
            let creationDate = creationDate
        else { throw TodoPersistentStorageError.transformationError  }
        
        
        return Todo(
            id: id,
            name: name,
            priority: priority,
            dueDate: dueDate,
            creationDate: creationDate,
            completedDate: completedDate
        )
    }
}

extension Array where Element: TodoPersistent {
    func mapTodos() -> [Todo] {
        do {
            return try self.map { try $0.toTodo() }
        } catch {
            return []
        }
    }
}

extension Todo {
    func toPersistentTodoAndAdd(to managedContext: NSManagedObjectContext) {
        let managedObject = TodoPersistent(context: managedContext)
        managedObject.id = id
        managedObject.name = name
        managedObject.priority = Int16(priority.rawValue)
        managedObject.dueDate = dueDate
        managedObject.creationDate = creationDate
        managedObject.completedDate = completedDate
    }
}
