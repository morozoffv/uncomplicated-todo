//
//  TodoListViewModel.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 08/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

class TodoListViewModel: TodoListViewModeling {
    
    private var isCompleted = false
    
    //TODO: remove dynamic?
    private(set) var sections: Dynamic<[WeekSection]> = Dynamic<[WeekSection]>([])
    
    private let todoStorage: TodoStoraging
    private let weekRangeBuilder: WeekRangeBuilder
    
    init(todoStorage: TodoStoraging, weekRangeBuilder: WeekRangeBuilder) {
        self.todoStorage = todoStorage
        self.weekRangeBuilder = weekRangeBuilder
        
        todoStorage.getAll { todos in
            self.sections.value = self.createWeekSections(todos: todos)
        }
    }
    
    func addTodo() {
//        let randomPriority = Priority(rawValue: Int.random(in: 0...2))!
//
//        let todo = Todo(
//            id: UUID(),
//            name: "Another Todo #\(todos.value.count)",
//            priority: randomPriority,
//            dueDate: Date(),
//            creationDate: Date(),
//            completedDate: isCompleted ? Date() : nil
//        )
//
//        todos.value.append(todo)
//        todoStorage.add(todo: todo)
//
//        isCompleted = !isCompleted
    }
    
    func removeTodo(at index: Int) {
//        let todo = todos.value[index]
//        todos.value.remove(at: index)
//        todoStorage.remove(for: todo.id)
    }
    
    private func createWeekSections(todos: [Todo]) -> [WeekSection] {
        
        let weekSortedTodos = sortedTodosByWeeks(from: todos)
        
        var sections = [WeekSection]()
        weekSortedTodos.keys.sorted { $0.lowerBound > $1.lowerBound }.forEach { key in
            guard let todos = weekSortedTodos[key] else { return }
            let items = todoListItems(from: todos)
            let todoItemsNumber = items.filter { if case .todo(_) = $0 { return true } else { return false } }.count
            sections.append(WeekSection(items: items, weekRange: key, todoNumber: todoItemsNumber))
        }
        
        return sections
    }
    
    private func sortedTodosByWeeks(from todos: [Todo]) -> [ClosedRange<Date>: [Todo]] {
        var sortedTodos = [ClosedRange<Date>: [Todo]]()
        
        todos.forEach { todo in
            guard let key = weekRangeBuilder.weekRangeFrom(dateInBetween: todo.dueDate) else { return }
            if sortedTodos[key] == nil { sortedTodos[key] = [] }
            sortedTodos[key]?.append(todo)
        }
        return sortedTodos
    }
    
    private func todoListItems(from todos: [Todo]) -> [TodoListItem] {
        let sortedTodos = todos.sorted { $0.dueDate < $1.dueDate }
        var weekdaySortedTodos: [Date: [Todo]] = [:]
        
        sortedTodos.forEach { todo in
            let key = todo.dueDate
            if weekdaySortedTodos[key] == nil { weekdaySortedTodos[key] = [] }
            weekdaySortedTodos[key]?.append(todo)
        }
        
        var items = [TodoListItem]()
        weekdaySortedTodos.keys.sorted { $0 < $1 }.forEach { key in
            guard let todos = weekdaySortedTodos[key] else { return }
            items.append(.weekday(date: key, todoNumber: todos.count))
            items.append(contentsOf: todos.map { TodoListItem.todo($0) })
        }
        
        return items
    }

}
