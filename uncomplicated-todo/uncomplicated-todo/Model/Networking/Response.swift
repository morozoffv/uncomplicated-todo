//
//  Response.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 26/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

enum NetworkError: Int, Error {
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case noResponse
    case serializationError
    case dataIsEmpty
    case urlNotFormed
    case unknown
    
    var description: String {
        switch self {
        case .badRequest:
            return "Bad request"
        case .unauthorized:
            return "Unauthorized"
        case .forbidden:
            return "Forbidden"
        case .notFound:
            return "Not found"
        case .unknown:
            return "Unknown"
        case .serializationError:
            return "Serialization error"
        case .urlNotFormed:
            return "URL not formed"
        case .dataIsEmpty:
            return "Data is empty"
        case .noResponse:
            return "No response"
        }
    }
    
}
