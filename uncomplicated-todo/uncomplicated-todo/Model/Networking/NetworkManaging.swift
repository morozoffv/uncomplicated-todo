//
//  NetworkManaging.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 26/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

protocol NetworkManaging {
    func requestHistory(completion: @escaping (Result<[HistoryItem], NetworkManagerError>) -> Void)
    func requestTasks(completion: @escaping (Result<[Task], NetworkManagerError>) -> Void)
    func addTask(completion: @escaping (Result<Void, NetworkManagerError>) -> Void)
    func moveToHistory(completion: @escaping (Result<Void, NetworkManagerError>) -> Void)
}

enum NetworkManagerError: Error {
    case parsingError
    case networkError(NetworkError)
}
