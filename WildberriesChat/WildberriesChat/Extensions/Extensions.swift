//
//  Extensions.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 14.06.2024.
//

import SwiftUI

extension String {
    mutating func applyRussianPhoneMask() {
        self = self.getRussianPhoneMask()
    }
    
    func getRussianPhoneMask()  -> String {
        var countryCode = "+7"
        countryCode = !self.hasPrefix(countryCode) ? "" : "\(countryCode) "
        
        let digits = self.filter { "0"..."9" ~= $0 }
        let formatted = digits.suffix(10).enumerated().map { index, character in
            if index == 3 || index == 6 {
                return " \(character)"
            } else if index == 8 {
                return "-\(character)"
            } else {
                return String(character)
            }
        }
        return countryCode + formatted.joined()
    }
}


extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
