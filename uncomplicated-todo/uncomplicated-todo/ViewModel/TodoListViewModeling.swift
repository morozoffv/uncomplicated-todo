//
//  TaskListViewModeling.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 08/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

protocol TodoListViewModeling {
    var todos: Dynamic<[Todo]> { get }
    func addTodo()
    func removeTodo(at index: Int)
}
