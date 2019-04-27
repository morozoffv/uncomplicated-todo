//
//  Network.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 25/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

class Network: Networking {
    func execute(request: Request, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        guard let urlRequest = buildUrlRequest(request) else {
            completion(.failure(NetworkError.urlNotFormed))
            return
        }
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.noResponse))
                return
            }
            
            guard error == nil else {
                completion(.failure(NetworkError(rawValue: response.statusCode) ?? NetworkError.unknown))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.dataIsEmpty))
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
    func buildUrlRequest(_ request: Request) -> URLRequest? {
        //TODO: add url builder if requests will become more complicated
        guard let url = URL(string: "\(NetworkConfiguration.baseUrl)/\(request.networkAction)") else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        urlRequest.setValue(
            NetworkConfiguration.contentTypeValue,
            forHTTPHeaderField: NetworkConfiguration.contentTypeKey
        )
        
        if request.method == .post, let requestQuery = request.query {
            guard let httpBody = try? JSONSerialization.data(withJSONObject: requestQuery, options: []) else {
                return nil
            }
            urlRequest.httpBody = httpBody
        }
        
        return urlRequest
    }
}
