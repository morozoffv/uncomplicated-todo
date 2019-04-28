//
//  TodoStoraging.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 27/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

protocol TodoStoraging {
    func add()
    func remove()
    func getAll()
    func edit()
}
