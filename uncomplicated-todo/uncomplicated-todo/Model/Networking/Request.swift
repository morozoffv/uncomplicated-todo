//
//  Request.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 26/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

struct Request {
    var method: HTTPMethod
    var query: [String : Any]?
    var headers: [String : String]
    var networkAction: NetworkAction
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum NetworkAction: String {
    case history = "history"
    case tasks = "tasks"
    case addTask = "add-task"
    case addToHistory = "add-to-history"
}
