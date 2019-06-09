//
//  TodoEditViewController.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 29/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import UIKit

class TodoEditViewController: UITableViewController {
    
    private lazy var rightBarButton = UIBarButtonItem(
        title: viewModel.rightBarButtonTitle,
        style: .done,
        target: self,
        action: #selector(rightBarButtonTapped))
    
    private lazy var cancelButton = UIBarButtonItem(
        title: "Cancel",
        style: .plain,
        target: self,
        action: #selector(cancelButtonTapped))
    
    private lazy var nameBond = Bond<String>() { [unowned self] name in
        self.viewModel.setName(name)
    }
    
    private lazy var dueDateBond = Bond<Date>() { [unowned self] date in
        self.viewModel.setDueDate(date)
    }
    
    private lazy var priorityBond = Bond<Priority>() { [unowned self] priority in
        self.viewModel.setPriority(priority)
    }
    
    private let viewModel: TodoEditViewModeling
    
    init(viewModel: TodoEditViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        title = viewModel.title
        navigationItem.rightBarButtonItem = rightBarButton
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    private func setupTableView() {
        tableView.separatorStyle = .none
        tableView.register(TodoEditDateCell.self, forCellReuseIdentifier: TodoEditDateCell.self.description())
        tableView.register(TodoEditNameCell.self, forCellReuseIdentifier: TodoEditNameCell.self.description())
        tableView.register(TodoEditPriorityCell.self, forCellReuseIdentifier: TodoEditPriorityCell.self.description())
    }
    
    @objc private func rightBarButtonTapped() {
        viewModel.rightBarButtonTapped()
    }
    
    @objc private func cancelButtonTapped() {
        //TODO: add cancel action
    }
    
    //MARK: Table View Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.items[indexPath.row]

        switch item {
        case .name:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: TodoEditNameCell.self.description(),
                for: indexPath) as! TodoEditNameCell
            
            nameBond.bind(dynamic: cell.name)
            
            cell.configure(name: viewModel.name, maxCharacters: viewModel.nameLength)
            return cell
            
        case .date:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: TodoEditDateCell.self.description(),
                for: indexPath) as! TodoEditDateCell
    
            dueDateBond.bind(dynamic: cell.date)
    
            cell.configure(initialDate: viewModel.dueDate)
            return cell
            
        case .priority:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: TodoEditPriorityCell.self.description(),
                for: indexPath) as! TodoEditPriorityCell
    
            priorityBond.bind(dynamic: cell.selectedPriority)
    
            cell.configure(priority: viewModel.priority)
            return cell
        }
    }
    
    //MARK: Table View Delegate
    
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }

}
