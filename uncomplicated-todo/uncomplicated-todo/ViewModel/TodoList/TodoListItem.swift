//
//  TodoListItem.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 19/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

enum TodoListItem: Equatable {
    case todo(id: UUID, name: String, priority: Priority, isCompleted: Bool)
    case weekday(weekday: String, dayMonth: String, todoNumber: Int)
}
