//
//  RootViewController.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 09/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    private let coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator.start(parent: self)
    }
    
}
