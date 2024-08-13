//
//  WildberriesChatWidgetLiveActivity.swift
//  WildberriesChatWidget
//
//  Created by Janiece Eleonour on 03.07.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct WildberriesChatWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct WildberriesChatWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WildberriesChatWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension WildberriesChatWidgetAttributes {
    fileprivate static var preview: WildberriesChatWidgetAttributes {
        WildberriesChatWidgetAttributes(name: "World")
    }
}

extension WildberriesChatWidgetAttributes.ContentState {
    fileprivate static var smiley: WildberriesChatWidgetAttributes.ContentState {
        WildberriesChatWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: WildberriesChatWidgetAttributes.ContentState {
         WildberriesChatWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: WildberriesChatWidgetAttributes.preview) {
   WildberriesChatWidgetLiveActivity()
} contentStates: {
    WildberriesChatWidgetAttributes.ContentState.smiley
    WildberriesChatWidgetAttributes.ContentState.starEyes
}
