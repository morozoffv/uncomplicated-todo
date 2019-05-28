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
    
    private lazy var subject11 = Todo(id: UUID(), name: "11, order: 4", priority: .high,
                                      dueDate: self.date(from: "2019-05-13T00:00:00+0000"),
                                      creationDate: self.date(from: "2019-05-11T00:00:00+0000"),
                                      completedDate: nil)
    
    private lazy var subject12 = Todo(id: UUID(), name: "12, order: 6", priority: .medium,
                                      dueDate: self.date(from: "2019-05-19T00:00:00+0000"),
                                      creationDate: self.date(from: "2019-05-11T00:00:00+0000"),
                                      completedDate: nil)
    
    private lazy var subject13 = Todo(id: UUID(), name: "13, order: 51", priority: .low,
                                      dueDate: self.date(from: "2019-05-16T00:00:00+0000"),
                                      creationDate: self.date(from: "2019-05-11T00:00:00+0000"),
                                      completedDate: nil)
    
    private lazy var subject14 = Todo(id: UUID(), name: "14, order: 52", priority: .high,
                                      dueDate: self.date(from: "2019-05-16T00:00:00+0000"),
                                      creationDate: self.date(from: "2019-05-12T00:00:00+0000"),
                                      completedDate: nil)
    
    private lazy var subject21 = Todo(id: UUID(), name: "21, order: 21", priority: .medium,
                                      dueDate: self.date(from: "2019-05-03T00:00:00+0000"),
                                      creationDate: self.date(from: "2019-05-02T00:00:00+0000"),
                                      completedDate: nil)
    
    private lazy var subject22 = Todo(id: UUID(), name: "22, order: 22", priority: .low,
                                      dueDate: self.date(from: "2019-05-03T00:00:00+0000"),
                                      creationDate: self.date(from: "2019-05-01T00:00:00+0000"),
                                      completedDate: nil)
    
    private lazy var subject23 = Todo(id: UUID(), name: "23, order: 23", priority: .high,
                                      dueDate: self.date(from: "2019-05-03T00:00:00+0000"),
                                      creationDate: self.date(from: "2019-05-01T00:00:00+0000"),
                                      completedDate: nil)
    
    private lazy var subject24 = Todo(id: UUID(), name: "24, order: 1", priority: .medium,
                                      dueDate: self.date(from: "2019-04-29T00:00:00+0000"),
                                      creationDate: self.date(from: "2019-04-13T00:00:00+0000"),
                                      completedDate: nil)
    
    private lazy var subject25 = Todo(id: UUID(), name: "25, order: 3", priority: .low,
                                      dueDate: self.date(from: "2019-05-04T00:00:00+0000"),
                                      creationDate: self.date(from: "2019-05-02T00:00:00+0000"),
                                      completedDate: nil)
    
    private lazy var testedTodos: [Todo] = [
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
    
//    lazy var earliestSectionTodoItems: [TodoListItem] = [
//        .weekday(date: self.date(from: "2019-04-29T00:00:00+0000"), todoNumber: 1),     //Monday
//        .todo(subject24),
//        .weekday(date: self.date(from: "2019-05-03T00:00:00+0000"), todoNumber: 3),     //Friday
//        .todo(subject21),
//        .todo(subject22),
//        .todo(subject23),
//        .weekday(date: self.date(from: "2019-05-04T00:00:00+0000"), todoNumber: 1),     //Saturday
//        .todo(subject25)
//    ]
    
    lazy var weekdayDate1 = self.date(from: "2019-04-29T00:00:00+0000")
    lazy var weekdayDate2 = self.date(from: "2019-05-03T00:00:00+0000")
    lazy var weekdayDate3 = self.date(from: "2019-05-04T00:00:00+0000")
    lazy var earliestSectionTodoItems: [TodoListItem] = [
        .weekday(weekday: weekdayDate1.weekday, dayMonth: weekdayDate1.dayMonth, todoNumber: 1),       //Monday
        .todo(id: subject24.id, name: subject24.name, priority: subject24.priority, isCompleted: subject24.isCompleted),
        .weekday(weekday: weekdayDate2.weekday, dayMonth: weekdayDate2.dayMonth, todoNumber: 3),       //Friday
        .todo(id: subject21.id, name: subject21.name, priority: subject21.priority, isCompleted: subject21.isCompleted),
        .todo(id: subject22.id, name: subject22.name, priority: subject22.priority, isCompleted: subject22.isCompleted),
        .todo(id: subject23.id, name: subject23.name, priority: subject23.priority, isCompleted: subject23.isCompleted),
        .weekday(weekday: weekdayDate3.weekday, dayMonth: weekdayDate3.dayMonth, todoNumber: 1),       //Saturday
        .todo(id: subject25.id, name: subject25.name, priority: subject25.priority, isCompleted: subject25.isCompleted),
    ]
    
    lazy var weekdayDate4 = self.date(from: "2019-05-13T00:00:00+0000")
    lazy var weekdayDate5 = self.date(from: "2019-05-16T00:00:00+0000")
    lazy var weekdayDate6 = self.date(from: "2019-05-19T00:00:00+0000")
    lazy var latestSectionTodoItems: [TodoListItem] = [
        .weekday(weekday: weekdayDate4.weekday, dayMonth: weekdayDate4.dayMonth, todoNumber: 1),      //Monday
        .todo(id: subject11.id, name: subject11.name, priority: subject11.priority, isCompleted: subject11.isCompleted),
        .weekday(weekday: weekdayDate5.weekday, dayMonth: weekdayDate5.dayMonth, todoNumber: 2),      //Thursday
        .todo(id: subject13.id, name: subject13.name, priority: subject13.priority, isCompleted: subject13.isCompleted),
        .todo(id: subject14.id, name: subject14.name, priority: subject14.priority, isCompleted: subject14.isCompleted),
        .weekday(weekday: weekdayDate6.weekday, dayMonth: weekdayDate6.dayMonth, todoNumber: 1),       //Sunday
        .todo(id: subject12.id, name: subject12.name, priority: subject12.priority, isCompleted: subject12.isCompleted)
    ]
    
    lazy var expectedSections: [WeekSection] = [
        WeekSection(items: latestSectionTodoItems,
                    weekStartEnd: DateUtils.dayMonths(from: self.date(from: "2019-05-13T00:00:00+0000")...self.date(from: "2019-05-19T00:00:00+0000")),
                    todoNumber: 4,
                    isOverdue: true),
        WeekSection(items: earliestSectionTodoItems,
                    weekStartEnd: DateUtils.dayMonths(from: self.date(from: "2019-04-29T00:00:00+0000")...self.date(from: "2019-05-05T00:00:00+0000")),
                    todoNumber: 5,
                    isOverdue: true)
    ]
    
    private lazy var viewModel: TodoListViewModeling = {
        //Tests assume that monday is the first day of the week.
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "UTC")!
        calendar.firstWeekday = 2

        return TodoListViewModel(todoStorage: TodoStorageMock(todos: testedTodos),
                          weekRangeBuilder: WeekRangeBuilder(calendar: calendar))
    }()
    
    func testTodoListSectionsSort() {
        let sections = viewModel.sections.value
        XCTAssertEqual(sections, expectedSections)
    }
    
    private func date(from string: String) -> Date {
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.date(from: string)!
    }
}
