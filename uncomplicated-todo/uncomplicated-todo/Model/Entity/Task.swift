//
//  Todo.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 26/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

enum Priority: Int, Decodable {
    case lowest = 0
    case medium = 1
    case highest = 2
}

struct Todo: Decodable {
    let id: UUID
    let name: String
    let priority: Priority
    let dueDate: Date
    let creationDate: Date
}
