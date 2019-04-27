//
//  Task.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 26/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

enum Priority: Int, Decodable {
    case lowest = 0
    case medium = 1
    case highest = 2
}

struct Task: Decodable {
    let id: UUID
    let name: String
    let priority: Priority
    let dueDate: Date
    let creationDate: Date
    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case priority
//        case dueDate = "due_date"
//        case creationDate = "creation_date"
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(UUID.self, forKey: .id)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.priority = try container.decode(Priority.self, forKey: .priority)
//        self.dueDate = try container.decode(Date.self, forKey: .dueDate)
//        self.creationDate = try container.decode(Date.self, forKey: .creationDate)
//    }
}
