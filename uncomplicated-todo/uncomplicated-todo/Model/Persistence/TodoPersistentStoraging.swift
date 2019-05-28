//
//  TodoPersistentStoraging.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 04/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

protocol TodoPersistentStoraging {
    func add(todo: Todo)
    func remove(for id: UUID)
    func update(for id: UUID, name: String, priority: Priority, dueDate: Date?, creationDate: Date, completedDate: Date?)
    func getAll(completion: @escaping ([Todo]) -> Void)
    func todo(for id: UUID, completion: @escaping (Todo?) -> Void)
}
