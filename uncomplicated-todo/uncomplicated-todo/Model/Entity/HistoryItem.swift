//
//  HistoryItem.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 26/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

struct HistoryItem: Decodable {
    let task: Task
    let doneAt: Date
    
//    enum CodingKeys: String, CodingKey {
//        case task
//        case completedDate = "completed_date"
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.task = try container.decode(Task.self, forKey: .task)
//        self.completedDate = try container.decode(Date.self, forKey: .completedDate)
//    }
}
