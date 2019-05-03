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
    
    private var todos: [Todo] = [Todo(id: UUID(),
                                      name: "Wash my hands",
                                      priority: .highest,
                                      dueDate: Date().addingTimeInterval(222222222),
                                      creationDate: Date(),
                                      completedDate: Date())]
    
    private lazy var tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.delegate = self
        return $0
    }(UITableView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])

        tableView.register(TodoCell.self, forCellReuseIdentifier: TodoCell.self.description())
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTodo))
    }
    
    @objc func addTodo() {
        todos.append(Todo(
            id: UUID(),
            name: "Another Todo #\(todos.count)",
            priority: .lowest,
            dueDate: Date(),
            creationDate: Date(),
            completedDate: Date())
        )
    }
}

extension ViewController: UITableViewDelegate {
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodoCell.self.description(), for: indexPath) as! TodoCell
        cell.configure(todo: todos[indexPath.count])
        return cell
    }
    
    
}
