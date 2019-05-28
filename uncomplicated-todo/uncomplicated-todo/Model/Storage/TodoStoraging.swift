//
//  TodoStoraging.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 27/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

protocol TodoStoraging {
    func add(todo: Todo)
    func remove(for id: UUID)
    func getAll(completion: @escaping ([Todo]) -> Void)
    func update(for id: UUID, name: String, priority: Priority, dueDate: Date?, creationDate: Date, completedDate: Date?)
    func update(todo: Todo, with completedDate: Date?)
}
