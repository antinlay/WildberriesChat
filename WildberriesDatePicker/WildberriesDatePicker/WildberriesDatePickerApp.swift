//
//  WildberriesDatePickerApp.swift
//  WildberriesDatePicker
//
//  Created by Janiece Eleonour on 06.07.2024.
//

import SwiftUI

@main
struct WildberriesDatePickerApp: App {
    var body: some Scene {
        @State var languageSettings = LanguageSetting()

        WindowGroup {
            ContentView()
                .environment(languageSettings)
                .environment(\.locale, languageSettings.locale)
        }
    }
}
