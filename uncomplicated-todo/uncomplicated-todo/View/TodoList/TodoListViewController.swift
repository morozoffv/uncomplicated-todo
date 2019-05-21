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
        tableView.register(WeekdayCell.self, forCellReuseIdentifier: WeekdayCell.self.description())
        
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
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let dateSectionView = DateSectionView(headerFontSize: 24)
        let sectionItem = viewModel.sections.value[section]
        dateSectionView.headerLabel.text = "Week"
        dateSectionView.dateLabel.text = sectionItem.weekStartEnd
        dateSectionView.todoCounterLabel.text = String(sectionItem.todoNumber)
        return dateSectionView
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return viewModel.sections.value[indexPath.section].items[indexPath.row].editable
    }
    
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return viewModel.sections.value[indexPath.section].items[indexPath.row].selectable
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.removeTodo(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.value.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections.value[section].items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.sections.value[indexPath.section].items[indexPath.row]
        
        switch item {
        case .todo(_, let name, let priority, let isCompleted):
            let cell = tableView.dequeueReusableCell(withIdentifier: TodoCell.self.description(), for: indexPath) as! TodoCell
            cell.configure(name: name, priority: priority, isCompleted: isCompleted)
            return cell

        case .weekday(let weekday, let dayMonth, let todoNumber):
            let cell = tableView.dequeueReusableCell(withIdentifier: WeekdayCell.self.description(), for: indexPath) as! WeekdayCell
            cell.configure(weekday: weekday, dayMonth: dayMonth, todoNumber: todoNumber)
            return cell
        }
    }
}

private extension TodoListItem {
    var editable: Bool {
        switch self {
        case .todo:
            return true
        case .weekday:
            return false
        }
    }
    
    var selectable: Bool {
        switch self {
        case .todo:
            return true
        case .weekday:
            return false
        }
    }
}

