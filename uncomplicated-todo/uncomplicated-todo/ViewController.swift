//
//  ViewController.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 23/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let networkManager = NetworkManager(network: Network())

    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.requestTodos { result in
            switch result {
            case .success(let todos):
                print(todos)
            case .failure(let error):
                print(error)
            }
        }
    }
}

