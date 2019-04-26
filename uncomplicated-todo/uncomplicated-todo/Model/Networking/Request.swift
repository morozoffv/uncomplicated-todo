//
//  Request.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 26/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

//TODO: add query with headers when it will be necessary
struct Request {
    var method: HTTPMethod
    var networkAction: NetworkAction
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum NetworkAction: String {
    case history = "history"
    case tasks = "tasks"
}
