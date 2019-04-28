//
//  DIFactories.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 28/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

protocol ViewControllerFactory {
    func makeViewController() -> ViewController
}

extension Container: ViewControllerFactory {
    func makeViewController() -> ViewController {
        return ViewController(factory: self)
    }
}
