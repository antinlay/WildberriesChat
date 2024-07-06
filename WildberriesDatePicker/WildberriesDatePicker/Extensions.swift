//
//  Extensions.swift
//  WildberriesDatePicker
//
//  Created by Janiece Eleonour on 07.07.2024.
//

import Foundation

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: Date, localeId: String) {
        let formatter = DateComponentsFormatter()
        formatter.calendar?.locale = Locale(identifier: localeId)
        formatter.unitsStyle = .spellOut
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: value)
        
        let dateString = formatter.string(from: components) ?? ""
        appendLiteral(dateString)
    }
}
