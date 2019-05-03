//
//  TodoStorage.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 27/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

class TodoStorage: TodoStoraging {
    
    private let networkManager: NetworkManaging
    private let persistentStorage: CoreDataStack
    
    //TODO: replace CoreDataStack with protocol
    init(networkManager: NetworkManaging, persistentStorage: CoreDataStack) {
        self.networkManager = networkManager
        self.persistentStorage = persistentStorage
    }
    
    func edit() {
        
    }
    
    func add() {
        
    }
    
    func remove() {
        
    }
    
    func getAll() {
        
    }
    

}
