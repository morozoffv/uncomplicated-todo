//
//  DateRangeBuilder.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 20/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

class DateRangeBuilder {
    
    private struct Constants {
        static let weekLength: Int = 7
    }
    
    private enum WeekBounds {
        case startDay
        case endDay
    }
    
    static func weekRangeFrom(dateInBetween: Date) -> ClosedRange<Date>? {
        guard let startDate = findWeekBound(of: dateInBetween, bound: .startDay),
            let endDate = findWeekBound(of: dateInBetween, bound: .endDay)
        else {
            return nil
        }
        
        return startDate...endDate
    }
    
//    static private func dateOfFirstDayOfTheWeek(from date: Date) -> Date? {
//        let calendar = Calendar.current
//        let weekdayComponents = calendar.dateComponents([.weekday], from: date)
//        var componentsToSubtract = DateComponents()
//
//        guard let weekday = weekdayComponents.weekday else { return nil }
//        let subtractor = weekdaySubtractor(weekday: weekday, firstDayOfTheWeek: calendar.firstWeekday)
//        componentsToSubtract.day = -(subtractor)
//        guard let weekStart = calendar.date(byAdding: componentsToSubtract, to: date) else { return nil }
//
//        let components = calendar.dateComponents([.year, .month, .day], from: weekStart)
//
//        let startDate = calendar.date(from: components)
//
//        return startDate
//    }
//
//    static private func dateOfLastDayOfTheWeek(from date: Date) -> Date? {
//        let calendar = Calendar.current
//        let weekdayComponents = calendar.dateComponents([.weekday], from: date)
//        var componentsToAdd = DateComponents()
//
//        guard let weekday = weekdayComponents.weekday else { return nil }
//        let addend = weekdayAddend(weekday: weekday, firstDayOfTheWeek: calendar.firstWeekday)
//        componentsToAdd.day = addend
//        guard let weekEnd = calendar.date(byAdding: componentsToAdd, to: date) else { return nil }
//
//        let components = calendar.dateComponents([.year, .month, .day], from: weekEnd)
//
//        let endDate = calendar.date(from: components)
//
//        return endDate
//    }
    
    static private func findWeekBound(of date: Date, bound: WeekBounds) -> Date? {
        let calendar = Calendar.current
        let weekdayComponents = calendar.dateComponents([.weekday], from: date)
        guard let weekday = weekdayComponents.weekday else { return nil }
        
        let dateComponents: DateComponents = {
            var dateComponents = DateComponents()
            switch bound {
            case .startDay:
                let subtractor = weekdaySubtractor(weekday: weekday, firstDayOfTheWeek: calendar.firstWeekday)
                dateComponents.day = -(subtractor)
            case .endDay:
                let addend = weekdayAddend(weekday: weekday, firstDayOfTheWeek: calendar.firstWeekday)
                dateComponents.day = addend
            }
            return dateComponents
        }()
        
        guard let weekBound = calendar.date(byAdding: dateComponents, to: date) else { return nil }
        let components = calendar.dateComponents([.year, .month, .day], from: weekBound)
        return calendar.date(from: components)
    }

    static private func weekdaySubtractor(weekday: Int, firstDayOfTheWeek: Int) -> Int {
        let subtractor = weekday - firstDayOfTheWeek
        return subtractor < 0 ? 6 : subtractor
    }
    
    static private func weekdayAddend(weekday: Int, firstDayOfTheWeek: Int) -> Int {
        let addend = ((weekday + Constants.weekLength) - (firstDayOfTheWeek - 1)) % 7
        let result = addend == 0 ? 7 : addend
        return Constants.weekLength - result
    }
}
