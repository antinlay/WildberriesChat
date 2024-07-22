//
//  AppShortCuts.swift
//  WildberriesChatIntents
//
//  Created by Janiece Eleonour on 03.07.2024.
//

import Foundation
import AppIntents

// MARK: - App Shortcuts

struct AppShortcuts: AppShortcutsProvider {
    
    @AppShortcutsBuilder
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: WildberriesChatIntents(),
            phrases: ["Make a New \(.applicationName)"],
            shortTitle: LocalizedStringResource(stringLiteral: "New Feature"),
            systemImageName: "apple.logo"
        )
    }
    
}
