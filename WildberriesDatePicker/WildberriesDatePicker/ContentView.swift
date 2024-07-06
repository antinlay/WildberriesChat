//
//  ContentView.swift
//  WildberriesDatePicker
//
//  Created by Janiece Eleonour on 06.07.2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(LanguageSetting.self) var languageSettings
    @State var dateString: Date = .init()
    @State var localeFlag: LocaleFlags = .🇷🇺
    
    var body: some View {
        ScrollView {
            Text("Choose Date and Flag")
                .font(.title)
                .fontDesign(.monospaced)
                .multilineTextAlignment(.center)
                .lineLimit(2, reservesSpace: true)
                .padding()
            
            DatePickerView(dateString: $dateString)
                .padding(.horizontal)
            FlagsPicker(localeFlag: $localeFlag)
                .padding(.horizontal)
            DateListView(dateString: $dateString, localeFlag: $localeFlag)
                .padding(.horizontal)
        }
        .onChange(of: localeFlag) {
            languageSettings.locale = Locale(identifier: localeFlag.localeId)
        }
    }
}

#Preview {
    @Previewable @State var languageSettings = LanguageSetting()
    
    
    ContentView()
        .environment(languageSettings)
        .environment(\.locale, languageSettings.locale)
}
