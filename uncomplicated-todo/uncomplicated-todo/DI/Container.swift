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
    private lazy var network: Networking = Network()
    private lazy var networkManager: NetworkManaging = NetworkManager(network: network)
    private lazy var todoStorage: TodoStoraging = TodoStorage(networkManager: networkManager)
    private lazy var historyStorage: HistoryStoraging = HistoryStorage(networkManager: networkManager)
}

protocol HistoryStorageFactory {
    func makeHistoryStorage() -> HistoryStoraging
}

protocol TodoStorageFactory {
    func makeTodoStorage() -> TodoStoraging
}

extension Container: HistoryStorageFactory {
    func makeHistoryStorage() -> HistoryStoraging {
        return historyStorage
    }
}

extension Container: TodoStorageFactory {
    func makeTodoStorage() -> TodoStoraging {
        return todoStorage
    }
}





