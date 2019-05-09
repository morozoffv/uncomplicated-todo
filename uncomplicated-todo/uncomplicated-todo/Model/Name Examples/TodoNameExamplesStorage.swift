//
//  TodoNameExamplesStorage.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 06/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

class TodoNameExamplesStorage {
    
    private let networkManager: NetworkManaging
    
    private(set) var todoNameExamples: [String] = []
    
    init(networkManager: NetworkManaging) {
        self.networkManager = networkManager
        networkManager.requestTodoNameExamples { result in
            switch result {
            case .success(let examples):
                self.todoNameExamples.append(contentsOf: examples)
            case .failure(_):
                break
            }
        }
    }
    
}
