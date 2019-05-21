//
//  DateUtils.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 21/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

extension Date {
    var weekday: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
    
    var dayMonth: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM"
        return dateFormatter.string(from: self)
    }
}

class DateUtils {
    static func dayMonths(from range: ClosedRange<Date>) -> String {
        return "\(range.lowerBound.dayMonth) - \(range.upperBound.dayMonth)"
    }
}
