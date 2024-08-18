//
//  WildberriesChatWidget.swift
//  WildberriesChatWidget
//
//  Created by Janiece Eleonour on 03.07.2024.
//

import WidgetKit
import SwiftUI
import AppIntents

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }
    
    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }
        
        return Timeline(entries: entries, policy: .atEnd)
    }
    
    //    func relevances() async -> WidgetRelevances<ConfigurationAppIntent> {
    //        // Generate a list containing the contexts this widget is relevant in.
    //    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct WildberriesChatWidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack {
            Text("Message:")
                .bold()
            Text("You awesome!")
            Spacer()
            Text("Pulse Emoji:")
                .bold()
            Text("\(entry.configuration.pulseEmoji)")
                .invalidatableContent()
            Button (intent: ConfigurationAppIntent.greenLove) {
                Text("Pulse")
            }
            
        }
    }    
}

struct WildberriesChatWidget: Widget {
    let kind: String = "WildberriesChatWidget"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            WildberriesChatWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var blueLove: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.pulseEmoji = "💙"
        return intent
    }
    
    fileprivate static var greenLove: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.pulseEmoji = "💚"
        return intent
    }
}

#Preview(as: .systemSmall) {
    WildberriesChatWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .blueLove)
    SimpleEntry(date: .now, configuration: .greenLove)
}
