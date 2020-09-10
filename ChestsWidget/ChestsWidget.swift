import WidgetKit
import SwiftUI
import Intents


struct ChestsWidgetEntryView : View {
    var entry: WidgetProvider.Entry
    
    var body: some View {
        ZStack {
            Color("WidgetBackground")
            ChestsView(entry: entry)
        }
    }
}

@main
struct ChestsWidget: Widget {
    let kind: String = "ChestsWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind,
                            intent: ChestsWidgetIntent.self,
                            provider: WidgetProvider()) { entry in
            ChestsWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Chests Widget")
        .description("Your Clash Royale chests on your home screen!")
        .supportedFamilies([.systemMedium])
    }
}

