//
//  AppIntent.swift
//  WildberriesChatWidget
//
//  Created by Janiece Eleonour on 03.07.2024.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource { "Configuration" }
    static var description: IntentDescription { "This is an example widget." }

    // An example configurable parameter.
    @Parameter(title: "Suggestion Emoji", default: "💜")
    var pulseEmoji: String
}
