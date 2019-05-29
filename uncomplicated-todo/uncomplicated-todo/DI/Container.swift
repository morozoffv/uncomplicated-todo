//
//  Container.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 27/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

class Container {
    private static let modelName = "uncomplicated_todo"
    
    //Here we declare single instances
    private lazy var network: Networking = Network()
    private lazy var networkManager: NetworkManaging = NetworkManager(network: network)
    private lazy var coreDataStack = CoreDataStack(modelName: Container.modelName)
    private lazy var todoPersistentStorage: TodoPersistentStoraging = TodoPersistentStorage(coreDataStack: coreDataStack)
    private lazy var todoStorage: TodoStoraging = TodoStorage(networkManager: networkManager, persistentStorage: todoPersistentStorage)
    private lazy var todoNameExamplesStorage: TodoNameExamplesStorage = TodoNameExamplesStorage(networkManager: networkManager)
    private lazy var settingsStorage: SettingsStoraging = SettingsStorage()

    //Here we make instances that might be created several times during app lifespan
    func makeTodoListViewModel() -> TodoListViewModeling {
        //TODO: replace storage with real one
        //return TodoListViewModel(todoStorage: TodoStorageMock(todos: testedTodos), weekRangeBuilder: WeekRangeBuilder(calendar: Calendar.current))

        return TodoListViewModel(todoStorage: todoStorage, weekRangeBuilder: WeekRangeBuilder(calendar: Calendar.current))
    }
    
    func makeTodoEditViewModel(todo: Todo) -> TodoEditViewModeling {
        return TodoEditViewModel(todo: todo, todoStorage: todoStorage)
    }
    
    func makeTodoAddViewModel() -> TodoEditViewModeling {
        return TodoAddViewModel(todoStorage: todoStorage)
    }
    
    //TODO: remove these later
    private lazy var subject11 = Todo(id: UUID(), name: "11, order: 4", priority: .high,
                                      dueDate: self.date(from: "2019-05-13T00:00:00+0000"),
                                      creationDate: self.date(from: "2019-05-11T00:00:00+0000"),
                                      completedDate: nil)
    
    private lazy var subject12 = Todo(id: UUID(), name: "12, order: 6", priority: .medium,
                                      dueDate: self.date(from: "2019-05-19T00:00:00+0000"),
                                      creationDate: self.date(from: "2019-05-11T00:00:00+0000"),
                                      completedDate: nil)
    
    private lazy var subject13 = Todo(id: UUID(), name: "13, order: 51", priority: .low,
                                      dueDate: self.date(from: "2019-05-16T00:00:00+0000"),
                                      creationDate: self.date(from: "2019-05-11T00:00:00+0000"),
                                      completedDate: nil)
    
    private lazy var subject14 = Todo(id: UUID(), name: "14, order: 52", priority: .high,
                                      dueDate: self.date(from: "2019-05-16T00:00:00+0000"),
                                      creationDate: self.date(from: "2019-05-12T00:00:00+0000"),
                                      completedDate: nil)
    
    private lazy var subject21 = Todo(id: UUID(), name: "21, order: 21", priority: .medium,
                                      dueDate: self.date(from: "2019-05-03T00:00:00+0000"),
                                      creationDate: self.date(from: "2019-05-02T00:00:00+0000"),
                                      completedDate: nil)
    
    private lazy var subject22 = Todo(id: UUID(), name: "22, order: 22", priority: .low,
                                      dueDate: self.date(from: "2019-05-03T00:00:00+0000"),
                                      creationDate: self.date(from: "2019-05-01T00:00:00+0000"),
                                      completedDate: nil)
    
    private lazy var subject23 = Todo(id: UUID(), name: "23, order: 23", priority: .high,
                                      dueDate: self.date(from: "2019-05-03T00:00:00+0000"),
                                      creationDate: self.date(from: "2019-05-01T00:00:00+0000"),
                                      completedDate: nil)
    
    private lazy var subject24 = Todo(id: UUID(), name: "24, order: 1", priority: .medium,
                                      dueDate: self.date(from: "2019-04-29T00:00:00+0000"),
                                      creationDate: self.date(from: "2019-04-13T00:00:00+0000"),
                                      completedDate: nil)
    
    private lazy var subject25 = Todo(id: UUID(), name: "25, order: 3", priority: .low,
                                      dueDate: self.date(from: "2019-05-04T00:00:00+0000"),
                                      creationDate: self.date(from: "2019-05-02T00:00:00+0000"),
                                      completedDate: nil)
    
    private lazy var testedTodos: [Todo] = [
        subject11,
        subject12,
        subject13,
        subject14,
        subject21,
        subject22,
        subject23,
        subject24,
        subject25
    ]
    
    private func date(from string: String) -> Date {
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.date(from: string)!
    }
}

//protocol TodoListViewModelingFactory { func makeTodoListViewModel() -> TodoListViewModeling }
//extension Container: TodoListViewModelingFactory {
//    func makeTodoListViewModel() -> TodoListViewModeling {
//        return TodoListViewModel(todoStorage: todoStorage)
//    }
//}
//protocol TodoStorageFactory { func makeTodoStorage() -> TodoStoraging }
//extension Container: TodoStorageFactory {
//    func makeTodoStorage() -> TodoStoraging {
//        return todoStorage
//    }
//}
//
//protocol TodoNameExamplesStorageFactory { func makeTodoNameExamplesStorage() -> TodoNameExamplesStorage }
//extension Container: TodoNameExamplesStorageFactory {
//    func makeTodoNameExamplesStorage() -> TodoNameExamplesStorage {
//        return todoNameExamplesStorage
//    }
//}
//
//protocol SettingsStorageFactory { func makeSettingsStorage() -> SettingsStoraging }
//extension Container: SettingsStorageFactory {
//    func makeSettingsStorage() -> SettingsStoraging {
//        return settingsStorage
//    }
//}


