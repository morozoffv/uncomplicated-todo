//
//  Coordinator.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 08/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import UIKit

class Coordinator {
    
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    func start(parent: UIViewController) {
//        let vm = container.makeTodoListViewModel()
//        let vc = TodoListViewController(viewModel: vm)
        
        let vm = container.makeTodoAddViewModel()
        let vc = TodoEditViewController(viewModel: vm)
        
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
//        parent.addChild(navigationController)
//        navigationController.view.frame = parent.view.bounds
//        parent.view.addSubview(navigationController.view)
//        navigationController.didMove(toParent: parent)
        
        let tabController = UITabBarController()
        tabController.viewControllers = [navigationController]
        parent.addChild(tabController)
        tabController.view.frame = parent.view.bounds
        parent.view.addSubview(tabController.view)
        tabController.didMove(toParent: parent)
    }
    
    
}
