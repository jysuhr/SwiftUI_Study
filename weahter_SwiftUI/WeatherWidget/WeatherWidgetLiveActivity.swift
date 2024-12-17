//
//  WeatherWidgetLiveActivity.swift
//  WeatherWidget
//
//  Created by 서준영 on 11/25/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct WeatherWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
        // 동적인 값
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
    // 정적인 값
}
// WWDC에 Dynamic Island가 정리되어있다.
struct WeatherWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WeatherWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // 다이나믹 아일랜드 확장 정의
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

extension WeatherWidgetAttributes {
    fileprivate static var preview: WeatherWidgetAttributes {
        WeatherWidgetAttributes(name: "World")
    }
}

extension WeatherWidgetAttributes.ContentState {
    fileprivate static var smiley: WeatherWidgetAttributes.ContentState {
        WeatherWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: WeatherWidgetAttributes.ContentState {
         WeatherWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: WeatherWidgetAttributes.preview) {
   WeatherWidgetLiveActivity()
} contentStates: {
    WeatherWidgetAttributes.ContentState.smiley
    WeatherWidgetAttributes.ContentState.starEyes
}
