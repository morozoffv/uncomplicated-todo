//
//  Task.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 26/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

enum Priority {
    case highest
    case medium
    case lowest
}

struct Task {
    let id: UUID
    let name: String
    let priority: Priority
    let dueDate: Date
    let creationDate: Date
}
