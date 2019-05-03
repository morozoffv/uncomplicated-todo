//
//  ViewController.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 23/04/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    typealias DIFactory = TodoStorageFactory
    private let factory: DIFactory
    
    private lazy var todoStorage: TodoStoraging = factory.makeTodoStorage()
    
    init(factory: DIFactory) {
        self.factory = factory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var todos: [Todo] = [Todo(id: UUID(),
                                      name: "Wash my hands",
                                      priority: .highest,
                                      dueDate: Date().addingTimeInterval(222222222),
                                      creationDate: Date(),
                                      completedDate: Date())]
    
    private lazy var tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.delegate = self
        $0.dataSource = self
        return $0
    }(UITableView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)

        tableView.anchor(
            top: view.topAnchor,
            leading: view.leadingAnchor,
            bottom: view.bottomAnchor,
            trailing: view.trailingAnchor
        )

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
        
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodoCell.self.description(), for: indexPath) as! TodoCell
        cell.configure(todo: todos[indexPath.row])
        return cell
    }
}


