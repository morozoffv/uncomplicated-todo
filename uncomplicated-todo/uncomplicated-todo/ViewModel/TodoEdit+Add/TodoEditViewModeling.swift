//
//  TodoEditViewModeling.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 28/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

enum TodoEditItem: CaseIterable {
    case name, date, priority
}

protocol TodoEditViewModeling {
    var items: [TodoEditItem] { get }
    var title: String { get }
    var rightBarButtonTitle: String { get }
    
    var name: String { get }
    var dueDate: Date { get }
    var priority: Priority { get }
    
    func rightBarButtonTapped()
    func setName(_ name: String)
    func setDueDate(_ date: Date)
    func setPriority(_ priority: Priority)    
}
