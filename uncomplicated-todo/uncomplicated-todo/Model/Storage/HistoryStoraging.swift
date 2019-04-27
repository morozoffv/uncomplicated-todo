//
//  HistoryStoraging.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 27/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

//TODO: add protocol Storaging and StorageEditable (with object mutability)
protocol HistoryStoraging: Storaging {
    func removeAll()    //TODO: move to extension?
}
