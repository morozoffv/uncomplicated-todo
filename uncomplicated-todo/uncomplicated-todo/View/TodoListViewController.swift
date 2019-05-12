//
//  TodoListViewController.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 08/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    private let viewModel: TodoListViewModeling
    
//    private lazy var todosBond = Bond<[Todo]>() { [unowned self] todos in
//        self.tableView.reloadData()
//    }
    
    init(viewModel: TodoListViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tableView.register(TodoCell.self, forCellReuseIdentifier: TodoCell.self.description())
        tableView.alwaysBounceVertical = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTodo))
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        title = "Tasks"

        //todosBond.bind(dynamic: viewModel.todos)
        
    }
    
    @objc func addTodo() {
        viewModel.addTodo()
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.removeTodo(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.todos.value.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodoCell.self.description(), for: indexPath) as! TodoCell
        cell.configure(todo: viewModel.todos.value[indexPath.row])
        return cell
    }
}
