//
//  UINavigationBarUtils.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 09/06/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import UIKit

extension UINavigationBar {
    static func configure() {
        UINavigationBar.appearance().tintColor = Colors.tintColor
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: Colors.primaryColor]
    }
}
