//
//  LanguageSetting.swift
//  WildberriesDatePicker
//
//  Created by Janiece Eleonour on 07.07.2024.
//

import SwiftUI

enum LocaleFlags: String, CaseIterable {
    case 🇷🇺
    case 🇸🇰
    case 🇸🇮
    case 🇧🇬
    case 🇭🇷
    
    var localeId: String {
        switch self {
        case .🇷🇺:
            return "ru_Ru"
        case .🇸🇰:
            return "sk_SK"
        case .🇸🇮:
            return "sl_SL"
        case .🇧🇬:
            return "bg_BG"
        case .🇭🇷:
            return "hr_HR"
        }
    }
}

@Observable
class LanguageSetting {
    var locale = Locale(identifier: "ru_RU")
}
