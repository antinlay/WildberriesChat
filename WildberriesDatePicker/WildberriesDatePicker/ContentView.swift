//
//  ContentView.swift
//  WildberriesDatePicker
//
//  Created by Janiece Eleonour on 06.07.2024.
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

struct ContentView: View {
    @Environment(LanguageSetting.self) var languageSettings
    
    @State var dateString: Date = .init()
    @State var localeFlag: LocaleFlags = .🇷🇺
    
    var body: some View {
        
        ScrollView {
            Text("Choose Date and Flag")
                .font(.largeTitle)
                .fontDesign(.monospaced)
                .padding(.vertical)
            DatePicker("Choose Date", selection: $dateString)
                .padding(.vertical)
            Picker("Country", selection: $localeFlag) {
                ForEach(LocaleFlags.allCases, id: \.self) { flag in
                    Text(flag.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding(.bottom)

            let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: dateString) ?? dateString
            let theDayBeforeYesterday = Calendar.current.date(byAdding: .day, value: -2, to: dateString) ?? dateString
            let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: dateString) ?? dateString
            let theDayAfterTomorrow = Calendar.current.date(byAdding: .day, value: 2, to: dateString) ?? dateString
            
            VStack {
                Text("""
                Позавчера: \n\(theDayBeforeYesterday, localeId: localeFlag.localeId)
                Вчера: \n\(yesterday, localeId: localeFlag.localeId)
                Сегодня: \n\(dateString, localeId: localeFlag.localeId)
                Завтра: \n\(tomorrow, localeId: localeFlag.localeId)
                Послезавтра: \n\(theDayAfterTomorrow, localeId: localeFlag.localeId)
                """)
                .font(.subheadline)
            }
        }
        .padding()
        .onChange(of: localeFlag) {
            languageSettings.locale = Locale(identifier: localeFlag.localeId)
        }
    }
}

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: Date, localeId: String) {
        let formatter = DateComponentsFormatter()
        formatter.calendar?.locale = Locale(identifier: localeId)
        formatter.unitsStyle = .spellOut
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: value)
        
        let dateString = formatter.string(from: components) ?? ""
        appendLiteral(dateString)
    }
}

@Observable
class LanguageSetting {
    // initialise this from UserDefaults if you like
    var locale = Locale(identifier: "en")
}


#Preview {
    ContentView()
}
