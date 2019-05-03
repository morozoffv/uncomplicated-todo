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

//TODO: add custom errors?

class CoreDataStack {
    private let modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(needToSave),
                                               name: UIApplication.willResignActiveNotification,
                                               object: nil
        )
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(needToSave),
                                               name: UIApplication.willTerminateNotification,
                                               object: nil
        )
    }
    
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores { storeDescription, error in
            print(storeDescription)
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    private(set) lazy var managedContext: NSManagedObjectContext = {
       return storeContainer.viewContext
    }()
    
    func saveContext() {
        guard managedContext.hasChanges else { return }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    @objc private func needToSave() {
        saveContext()
    }
}
