//
//  ViewController.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 23/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    typealias DIFactory = HistoryStorageFactory & TodoStorageFactory
    private let factory: DIFactory
    
    private lazy var historyStorage: HistoryStoraging = factory.makeHistoryStorage()
    private lazy var todoStorage: TodoStoraging = factory.makeTodoStorage()
    
    init(factory: DIFactory) {
        self.factory = factory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}


