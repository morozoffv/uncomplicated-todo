//
//  WeekSection.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 19/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

struct WeekSection: Equatable {
    let items: [TodoListItem]
    let weekStartEnd: String
    let todoNumber: Int
}
