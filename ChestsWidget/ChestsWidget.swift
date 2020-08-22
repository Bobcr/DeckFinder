import WidgetKit
import SwiftUI
import Intents

struct PlaceholderView : View {
    var body: some View {
        ChestsWidgetEntryView.init(entry: testChestsEntry)
    }
}

struct ChestsWidgetEntryView: View {
    var entry: WidgetProvider.Entry
    
    var body: some View {
        if UD.sharedValue(forKey: .playerTag) == nil {
            Text("Set Your Player Tag In the Royale Alchemist Settings")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
        }
        else {
            ZStack {
                Color(red: 225/255, green: 225/255, blue: 235/255)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    makeNormalChests()
                    Spacer()
                    makeValuableChests()
                }
                .padding(.vertical, 10)
            }
        }
    }
    
    func makeNormalChests() -> some View {
        let chests = entry.chests
        
        return HStack(alignment: .bottom, spacing: 0) {
            ForEach(0...8, id: \.self) { idx in
                VStack(spacing: 0) {
                    chests.items![idx].name!
                        .chestNameToChestImage()
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width/11.5)
                        .padding(.bottom, 2)
                    
                    Text("\(idx+1)")
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .background(Circle()
                                        .foregroundColor(.orange)
                                        .frame(width: UIScreen.main.bounds.width/25,
                                               height: UIScreen.main.bounds.width/25))
                }
            }
        }
    }
    
    func makeValuableChests() -> some View {
        let chests = entry.chests
        
        return HStack(alignment: .bottom, spacing: 0) {
            ForEach(0...(chests.items!.count-10), id: \.self) { idx in
                VStack(spacing: 0) {
                    if chests.items![idx+9].index! > 8 {
                        chests.items![idx+9].name!
                            .chestNameToChestImage()
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width/7)
                            .padding(.bottom, 3)
                        
                        Text("\(chests.items![idx+9].index!+1)")
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.horizontal, 3.5)
                            .background(Capsule()
                                            .foregroundColor(.orange)
                                            .frame(height: UIScreen.main.bounds.width/21))
                    }
                }
            }
        }
    }
    
}

@main
struct ChestsWidget: Widget {
    private let kind: String = "ChestsWidget"
    
    public var body: some WidgetConfiguration {
        StaticConfiguration.init(kind: kind,
                                 provider: WidgetProvider()) { entry in
            
            ChestsWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Chests")
        .description("Shows your Clash Royale chests")
        .supportedFamilies([.systemMedium])
    }
}

struct ChestsWidget_Previews: PreviewProvider {
    static var previews: some View {
        ChestsWidgetEntryView(entry: testChestsEntry)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
