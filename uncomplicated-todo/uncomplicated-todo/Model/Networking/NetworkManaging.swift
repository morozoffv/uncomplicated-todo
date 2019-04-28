//
//  NetworkManaging.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 26/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

protocol NetworkManaging {
    func requestTodos(completion: @escaping (Result<[Todo], NetworkManagerError>) -> Void)
    func addTodo(completion: @escaping (Result<Void, NetworkManagerError>) -> Void)
    func completeTodo(completion: @escaping (Result<Void, NetworkManagerError>) -> Void)
}

enum NetworkManagerError: Error {
    case parsingError
    case networkError(NetworkError)
}
