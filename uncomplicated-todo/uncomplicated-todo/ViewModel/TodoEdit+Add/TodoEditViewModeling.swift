//
//  TodoEditViewModeling.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 28/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

protocol TodoEditViewModeling {
    var title: String { get }
    var rightBarButtonTitle: String { get }
    var editedTodo: Todo? { get }
    
    func rightBarButtonTapped()
    func setName(_ name: String)
    func setDueDate(_ name: Date)
    func setPriority(_ priority: Priority)    
}
