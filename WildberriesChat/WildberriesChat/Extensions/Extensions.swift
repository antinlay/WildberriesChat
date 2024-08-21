//
//  Extensions.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 14.06.2024.
//

import SwiftUI
import ExyteChat

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

extension UIImage {
    var base64: String? {
        self.jpegData(compressionQuality: 1)?.base64EncodedString()
    }
}

extension String {
    var imageFromBase64: UIImage? {
        guard let imageData = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
            print("Не удалось создать изображение из данных")
            return nil
        }
        return UIImage(data: imageData)
    }
}

extension Message {
    var time: String {
        DateFormatter.timeFormatter.string(from: createdAt)
    }
}

extension DateFormatter {
    static let timeFormatter = {
        let formatter = DateFormatter()

        formatter.dateStyle = .none
        formatter.timeStyle = .short

        return formatter
    }()

    static let relativeDateFormatter = {
        let relativeDateFormatter = DateFormatter()
        relativeDateFormatter.timeStyle = .none
        relativeDateFormatter.dateStyle = .full
        relativeDateFormatter.locale = Locale(identifier: "en_US")
        relativeDateFormatter.doesRelativeDateFormatting = true

        return relativeDateFormatter
    }()

    static func timeString(_ seconds: Int) -> String {
        let hour = Int(seconds) / 3600
        let minute = Int(seconds) / 60 % 60
        let second = Int(seconds) % 60

        if hour > 0 {
            return String(format: "%02i:%02i:%02i", hour, minute, second)
        }
        return String(format: "%0i:%02i", minute, second)
    }
}
