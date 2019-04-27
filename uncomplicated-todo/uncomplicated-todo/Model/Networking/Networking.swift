//
//  Networking.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 25/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

protocol Networking {
    func execute(request: Request, completion: @escaping (Result<Data, NetworkError>) -> Void)
}
