//
//  Container.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 27/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

//Here we contain single instances
class Container {
    private static let modelName = "uncomplicated_todo"
    
    private lazy var network: Networking = Network()
    private lazy var networkManager: NetworkManaging = NetworkManager(network: network)
    private lazy var coreDataStack = CoreDataStack(modelName: Container.modelName)
    private lazy var todoPersistentStorage: TodoPersistentStoraging = TodoPersistentStorage(coreDataStack: coreDataStack)
    private lazy var todoStorage: TodoStoraging = TodoStorage(networkManager: networkManager, persistentStorage: todoPersistentStorage)
    private lazy var todoNameExamplesStorage: TodoNameExamplesStorage = TodoNameExamplesStorage(networkManager: networkManager)
}

protocol TodoStorageFactory {
    func makeTodoStorage() -> TodoStoraging
}

extension Container: TodoStorageFactory {
    func makeTodoStorage() -> TodoStoraging {
        return todoStorage
    }
}

protocol TodoNameExamplesStorageFactory {
    func makeTodoNameExamplesStorage() -> TodoNameExamplesStorage
}

extension Container: TodoNameExamplesStorageFactory {
    func makeTodoNameExamplesStorage() -> TodoNameExamplesStorage {
        return todoNameExamplesStorage
    }
}
