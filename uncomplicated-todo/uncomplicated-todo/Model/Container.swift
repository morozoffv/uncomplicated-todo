//
//  Container.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 27/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

class Container {
    private let network: Networking = Network()
    private lazy var networkManager: NetworkManaging = NetworkManager(network: self.network)
    
}
