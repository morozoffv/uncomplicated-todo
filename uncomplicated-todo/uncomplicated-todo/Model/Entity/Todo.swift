//
//  Todo.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 28/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

enum Priority: Int, Codable {
    case low = 0
    case medium = 1
    case high = 2
}

struct Todo: Codable {
    let id: UUID
    let name: String
    let priority: Priority
    let dueDate: Date?
    let creationDate: Date
    let completedDate: Date?
}

extension Todo {
    var isCompleted: Bool {
        return completedDate != nil
    }
}
