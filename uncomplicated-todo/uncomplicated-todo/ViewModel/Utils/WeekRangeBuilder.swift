//
//  WeekRangeBuilder.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 20/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

class WeekRangeBuilder {
    
    private struct Constants {
        static let weekLength: Int = 7
    }
    
    private enum WeekBounds {
        case startDay
        case endDay
    }
    
    private var calendar: Calendar
    
    init(calendar: Calendar = Calendar.current) {
        //TODO: Should I change the timezone?
        self.calendar = calendar
        self.calendar.timeZone = TimeZone(identifier: "UTC")!
    }
    
    func weekRangeFrom(dateInBetween: Date) -> ClosedRange<Date>? {
        guard let startDate = findWeekBound(of: dateInBetween, bound: .startDay),
            let endDate = findWeekBound(of: dateInBetween, bound: .endDay)
        else {
            return nil
        }
        
        return startDate...endDate
    }
    
    private func findWeekBound(of date: Date, bound: WeekBounds) -> Date? {
        
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

    private func weekdaySubtractor(weekday: Int, firstDayOfTheWeek: Int) -> Int {
        let subtractor = weekday - firstDayOfTheWeek
        return subtractor < 0 ? 6 : subtractor
    }
    
    private func weekdayAddend(weekday: Int, firstDayOfTheWeek: Int) -> Int {
        let addend = ((weekday + Constants.weekLength) - (firstDayOfTheWeek - 1)) % 7
        let result = addend == 0 ? 7 : addend
        return Constants.weekLength - result
    }
}
