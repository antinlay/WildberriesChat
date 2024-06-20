//
//  ChatWidget.swift
//  ChatWidget
//
//  Created by Janiece Eleonour on 20.06.2024.
//

import WidgetKit
import SwiftUI
//import WildberriesChat

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
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct ChatWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
//            Text("Time:")
//            Text(entry.date, style: .time)
//
//            Text("Favorite Emoji:")
//            Text(entry.configuration.favoriteEmoji)
//
//            Image(systemName: "link.circle.fill")
//                .symbolRenderingMode(.multicolor)
//                .resizable()
//                .scaledToFit()
            
            let socials: [ImageResource] = [.Social.twitter, .Social.instagram, .Social.linkedin, .Social.facebook]
            let contact = Contact.contacts.first!
            
            VStack {
                Image(contact.avatar!)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
//                    .frame(width: 40)
                Text(contact.name)
                    .bold()
                Text(contact.phoneNumber.applyPhoneMask())
                    .font(.system(size: 10))
                    .foregroundStyle(.appGray)
                
                HStack {
                    ForEach(socials.indices, id: \.self) { index in
                        Capsule()
                            .stroke(.accent, lineWidth: 1.67)
                            .overlay(Image(socials[index]))
                            .onTapGesture {
                                //
                            }
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 30)
//                .padding()
            }
//            .padding(EdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10))
//            .frame(maxWidth: .infinity)
            .background(.appBackground)

        }
    }
}

struct ChatWidget: Widget {
    let kind: String = "ChatWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            ChatWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview("small", as: .systemSmall) {
    ChatWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
    SimpleEntry(date: .now, configuration: .starEyes)
}

#Preview("medium", as: .systemMedium) {
    ChatWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
    SimpleEntry(date: .now, configuration: .starEyes)
}


#Preview("large", as: .systemLarge) {
    ChatWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
    SimpleEntry(date: .now, configuration: .starEyes)
}

#Preview("extraLarge", as: .systemExtraLarge) {
    ChatWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
    SimpleEntry(date: .now, configuration: .starEyes)
}
