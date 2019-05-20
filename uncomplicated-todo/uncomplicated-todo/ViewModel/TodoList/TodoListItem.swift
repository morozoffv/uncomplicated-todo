//
//  TodoListItem.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 19/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

enum TodoListItem {
    case todo(Todo)
    case weekday(date: Date, todoNumber: Int)
}
