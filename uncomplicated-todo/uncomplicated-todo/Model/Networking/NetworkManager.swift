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
//                guard let history = try? Parser<[HistoryItem]>.decode(historyData) else {
//                    completion(.failure(.parsingError))
//                    return
//                }
                
                do {
                    let history = try Parser<[HistoryItem]>.decode(historyData)
                    completion(.success(history))
                } catch {
                   print(error)
                }
                
//                completion(.success(history))
                
            case .failure(let error):
                completion(.failure(.networkError(error)))
                return
            }
        }
    }
    
    func requestTasks(completion: @escaping (Result<[Task], NetworkManagerError>) -> Void) {
        
    }
    
    func addTask(completion: @escaping (Result<Void, NetworkManagerError>) -> Void) {
        
    }
    
    func moveToHistory(completion: @escaping (Result<Void, NetworkManagerError>) -> Void) {
        
    }
}
