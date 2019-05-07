//
//  CoreDataStack.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 03/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation
import CoreData
import UIKit

enum CoreDataStackError: Error {
    case loadPersistentStoresError
}

class CoreDataStack {
    private let modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    private(set) lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores { storeDescription, error in
            guard error == nil else {
                fatalError(CoreDataStackError.loadPersistentStoresError.localizedDescription)
            }
        }
        return container
    }()
}
