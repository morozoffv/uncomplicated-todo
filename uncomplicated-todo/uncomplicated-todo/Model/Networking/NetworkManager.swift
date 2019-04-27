//
//  NetworkManager.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 26/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

class NetworkManager: NetworkManaging {
    
    private let network: Networking
    
    init(network: Networking) {
        self.network = network
    }
    
    func requestHistory(completion: @escaping (Result<[HistoryItem], NetworkManagerError>) -> Void) {
        let request = Request(method: .get, query: nil, headers: [:], networkAction: .history)
        network.execute(request: request) { result in
            switch result {
            case .success(let historyData):
                guard let history = try? Parser<[HistoryItem]>.decode(historyData) else {
                    completion(.failure(.parsingError))
                    return
                }
                completion(.success(history))
                
            case .failure(let error):
                completion(.failure(.networkError(error)))
                return
            }
        }
    }
    
    func requestTodos(completion: @escaping (Result<[Todo], NetworkManagerError>) -> Void) {
        let request = Request(method: .get, query: nil, headers: [:], networkAction: .todos)
        network.execute(request: request) { result in
            switch result {
            case .success(let historyData):
                guard let history = try? Parser<[Todo]>.decode(historyData) else {
                    completion(.failure(.parsingError))
                    return
                }
                completion(.success(history))
                
            case .failure(let error):
                completion(.failure(.networkError(error)))
                return
            }
        }
    }
    
    func addTodo(completion: @escaping (Result<Void, NetworkManagerError>) -> Void) {
        //TODO: implement
    }
    
    func moveToHistory(completion: @escaping (Result<Void, NetworkManagerError>) -> Void) {
        //TODO: implement
    }
}
