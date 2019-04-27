//
//  ViewController.swift
//  uncomplicated-todo
//
//  Created by Vlad on 23/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let networkManager = NetworkManager(network: Network())

    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.requestHistory { result in
            switch result {
            case .success(let history):
                print(history)
            case .failure(let error):
                print(error)
            }
        }
        
        
    }


}

