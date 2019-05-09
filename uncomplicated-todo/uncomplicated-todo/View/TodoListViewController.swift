//
//  TodoListViewController.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 08/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    private let viewModel: TodoListViewModeling
    
    init(viewModel: TodoListViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        print("ok")
    }
    
    
    
}
