//
//  TodoListViewModel.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 08/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

class TodoListViewModel: TodoListViewModeling {
    private(set) var todos: Dynamic<[Todo]> = Dynamic<[Todo]>([])
    
    private let todoStorage: TodoStoraging
    
    init(todoStorage: TodoStoraging) {
        self.todoStorage = todoStorage
    }
}
