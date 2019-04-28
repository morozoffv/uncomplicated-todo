//
//  NetworkConfiguration.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 26/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

class NetworkConfiguration {
    
    static var baseUrl: String {
        return "https://demo6230090.mockable.io"
    }
    
    static let contentTypeKey: String = "Content-Type"
    static let contentTypeValue: String = "application/json"
}

enum NetworkAction: String {
    case todos = "todos"
    case addTask = "add-task"
    case addToHistory = "add-to-history"
}
