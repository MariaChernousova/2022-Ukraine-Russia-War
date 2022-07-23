//
//  Date+Extensions.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 08.07.2022.
//

import Foundation

extension Date {
    func isEqual(to date: Date,
                 toGranularity component: Calendar.Component,
                 in calendar: Calendar = .current) -> Bool {
        calendar.isDate(self, equalTo: date, toGranularity: component)
        
    }
    
    func isInSameWeek(as date: Date) -> Bool {
        isEqual(to: date, toGranularity: .weekOfYear)
    }
}
