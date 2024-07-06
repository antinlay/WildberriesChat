//
//  ChatWidgetLiveActivity.swift
//  ChatWidget
//
//  Created by Janiece Eleonour on 20.06.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ChatWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct ChatWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ChatWidgetAttributes.self) { context in
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

extension ChatWidgetAttributes {
    fileprivate static var preview: ChatWidgetAttributes {
        ChatWidgetAttributes(name: "World")
    }
}

extension ChatWidgetAttributes.ContentState {
    fileprivate static var smiley: ChatWidgetAttributes.ContentState {
        ChatWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: ChatWidgetAttributes.ContentState {
         ChatWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: ChatWidgetAttributes.preview) {
   ChatWidgetLiveActivity()
} contentStates: {
    ChatWidgetAttributes.ContentState.smiley
    ChatWidgetAttributes.ContentState.starEyes
}
