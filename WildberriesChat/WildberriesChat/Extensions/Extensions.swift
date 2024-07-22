//
//  Extensions.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 14.06.2024.
//

import SwiftUI

extension View {
    func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
         if conditional {
             return AnyView(content(self))
         } else {
             return AnyView(self)
         }
     }
}

extension String {
    func maskInsert(mask: String, text: String, currentIndex: Index) -> String{
        var phoneNumber = ""
        var textIndex = currentIndex
        for char in mask {
            if char == "#" {
                phoneNumber.append(text[textIndex])
                if textIndex != text.endIndex {
                    textIndex = text.index(after: textIndex)
                }
            } else {
                phoneNumber.append(char)
            }
        }
        return phoneNumber
    }
    
    func applyPhoneMask() -> String {
        if (self.count == 11 && self.prefix(1) == "8") || (self.count == 12 && self.prefix(2) == "+7"), let _ = UInt(self) {
//            let digits = self.filter { $0.isNumber }
            var mask = "+7 ### ###-##-##"
            var currentIndex = self.index(self.startIndex, offsetBy: 1)
            if self.prefix(2) == "+7" {
                currentIndex = self.index(currentIndex, offsetBy: 1)
            }
            if self.prefix(5) == "+7800" || self.prefix(4) == "8800" {
                mask = "8 (###) ###-##-##"
            }
            return maskInsert(mask: mask, text: self, currentIndex: currentIndex)
        } else {
            return self
        }
    }
}


extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
