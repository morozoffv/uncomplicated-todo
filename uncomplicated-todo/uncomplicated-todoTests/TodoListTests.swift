//
//  TodoListTests.swift
//  uncomplicated-todoTests
//
//  Created by Vladislav Morozov on 19/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation
import XCTest

class TodoListTests: XCTestCase {
    
    
    lazy var subject11 = Todo(id: UUID(), name: "11, order: 4", priority: .high,
                              dueDate: self.date(from: "2019-05-13T00:00:00+0000"),
                              creationDate: self.date(from: "2019-05-11T00:00:00+0000"),
                              completedDate: nil)
    
    lazy var subject12 = Todo(id: UUID(), name: "12, order: 6", priority: .medium,
                              dueDate: self.date(from: "2019-05-19T00:00:00+0000"),
                              creationDate: self.date(from: "2019-05-11T00:00:00+0000"),
                              completedDate: nil)
    
    lazy var subject13 = Todo(id: UUID(), name: "13, order: 51", priority: .low,
                              dueDate: self.date(from: "2019-05-16T00:00:00+0000"),
                              creationDate: self.date(from: "2019-05-11T00:00:00+0000"),
                              completedDate: nil)
    
    lazy var subject14 = Todo(id: UUID(), name: "14, order: 52", priority: .high,
                              dueDate: self.date(from: "2019-05-16T00:00:00+0000"),
                              creationDate: self.date(from: "2019-05-12T00:00:00+0000"),
                              completedDate: nil)
    
    lazy var subject21 = Todo(id: UUID(), name: "21, order: 21", priority: .medium,
                              dueDate: self.date(from: "2019-05-03T00:00:00+0000"),
                              creationDate: self.date(from: "2019-05-02T00:00:00+0000"),
                              completedDate: nil)
    
    lazy var subject22 = Todo(id: UUID(), name: "22, order: 22", priority: .low,
                              dueDate: self.date(from: "2019-05-03T00:00:00+0000"),
                              creationDate: self.date(from: "2019-05-01T00:00:00+0000"),
                              completedDate: nil)
    
    lazy var subject23 = Todo(id: UUID(), name: "23, order: 23", priority: .high,
                              dueDate: self.date(from: "2019-05-03T00:00:00+0000"),
                              creationDate: self.date(from: "2019-05-01T00:00:00+0000"),
                              completedDate: nil)
    
    lazy var subject24 = Todo(id: UUID(), name: "24, order: 1", priority: .medium,
                              dueDate: self.date(from: "2019-04-29T00:00:00+0000"),
                              creationDate: self.date(from: "2019-04-13T00:00:00+0000"),
                              completedDate: nil)
    
    lazy var subject25 = Todo(id: UUID(), name: "25, order: 3", priority: .low,
                              dueDate: self.date(from: "2019-05-04T00:00:00+0000"),
                              creationDate: self.date(from: "2019-05-02T00:00:00+0000"),
                              completedDate: nil)

    lazy var testedTodos: [Todo] = [
        subject11,
        subject12,
        subject13,
        subject14,
        subject21,
        subject22,
        subject23,
        subject24,
        subject25
    ]
    
    lazy var earliestSectionTodoItems: [TodoListItem] = [
        .weekday(date: self.date(from: "2019-04-29T00:00:00+0000"), todoNumber: 1),     //Monday
        .todo(subject24),
        .weekday(date: self.date(from: "2019-05-03T00:00:00+0000"), todoNumber: 3),     //Friday
        .todo(subject21),
        .todo(subject22),
        .todo(subject23),
        .weekday(date: self.date(from: "2019-05-04T00:00:00+0000"), todoNumber: 1),     //Saturday
        .todo(subject25)
    ]
    
    lazy var latestSectionTodoItems: [TodoListItem] = [
        .weekday(date: self.date(from: "2019-05-13T00:00:00+0000"), todoNumber: 1),     //Monday
        .todo(subject11),
        .weekday(date: self.date(from: "2019-05-16T00:00:00+0000"), todoNumber: 2),     //Thursday
        .todo(subject13),
        .todo(subject14),
        .weekday(date: self.date(from: "2019-05-19T00:00:00+0000"), todoNumber: 1),     //Sunday
        .todo(subject12)
    ]
    
    lazy var expectedSections: [WeekSection] = [
        WeekSection(items: latestSectionTodoItems,
            weekRange: self.date(from: "2019-05-13T00:00:00+0000")...self.date(from: "2019-05-19T00:00:00+0000"),
            todoNumber: 4),
        WeekSection(items: earliestSectionTodoItems,
            weekRange: self.date(from: "2019-04-29T00:00:00+0000")...self.date(from: "2019-05-05T00:00:00+0000"),
            todoNumber: 5)
    ]
    
    func testTodoListSectionsSort() {
        
    }
    
    private func createWeekSections(todos: [Todo]) -> [WeekSection] {
        var sections = [WeekSection]()
        var sortedTodos: [ClosedRange<Date>: Todo] = [:]
        todos.forEach { todo in
            sortedTodos[da]
        }
        
        
        
        
        return sections
    }
    
    
    
    private func date(from string: String) -> Date {
        let dateFormatter = DateFormatter()
        return dateFormatter.date(from: string)!
    }
    
    //Takes into account all possible first weekday scenarios
    
    private func dateOfFirstDayOfTheWeek(from date: Date) -> Date? {
        let calendar = Calendar.current
        let weekdayComponents = calendar.dateComponents([.weekday], from: date)
        var componentsToSubtract = DateComponents()
        
        guard let weekday = weekdayComponents.weekday else { return nil }
        let subtractor = weekdaySubtractor(weekday: weekday, firstDayOfTheWeek: calendar.firstWeekday)
        componentsToSubtract.day = -(subtractor)
        guard let weekStart = calendar.date(byAdding: componentsToSubtract, to: date) else { return nil }
        
        let components = calendar.dateComponents([.year, .month, .day], from: weekStart)
        
        return calendar.date(from: components)
    }
    
    private func weekdaySubtractor(weekday: Int, firstDayOfTheWeek: Int) -> Int {
        let subtractor = weekday - firstDayOfTheWeek
        return subtractor < 0 ? 6 : subtractor
    }
    
    
}
