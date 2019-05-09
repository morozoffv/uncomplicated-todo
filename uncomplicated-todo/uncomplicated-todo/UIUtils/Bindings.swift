//
//  Bindings.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 07/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

class Dynamic<T> {
    var value: T {
        didSet {
            for bondBox in bonds {
                bondBox.bond?.listener(value)
            }
        }
    }
    
    var bonds: [BondBox<T>] = []
    
    init(_ v: T) {
        value = v
    }
}

class Bond<T> {
    typealias Listener = (T) -> Void
    var listener: Listener
    
    init(_ listener: @escaping Listener) {
        self.listener = listener
    }
    
    func bind(dynamic: Dynamic<T>) {
        dynamic.bonds.append(BondBox(self))
    }
}

class BondBox<T> {
    weak var bond: Bond<T>?
    init(_ b: Bond<T>) { bond = b }
}
