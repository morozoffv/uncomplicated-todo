//
//  TaskListViewModeling.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 08/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

protocol TodoListViewModeling {
    var sections: Dynamic<[WeekSection]> { get }
    func addTodo()
    func removeTodo(id: UUID)
    func completeTodo(id: UUID)
}
