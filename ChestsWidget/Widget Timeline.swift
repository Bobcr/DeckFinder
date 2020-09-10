import Foundation
import WidgetKit
import SwiftUI
import Intents
import Combine

struct WidgetProvider: IntentTimelineProvider {
    
    func placeholder(in context: Context) -> ChestsEntry {
        return testChestsEntry
    }
    
    func getSnapshot(for configuration: ChestsWidgetIntent,
                     in context: Context,
                     completion: @escaping (ChestsEntry) -> ()) {
        
        return completion(testChestsEntry)
    }
    
    func getTimeline(for configuration: ChestsWidgetIntent,
                     in context: Context,
                     completion: @escaping (Timeline<ChestsEntry>) -> ()) {
        
        if let playerTag = configuration.playerTag {
            
            let playerTag = playerTag.uppercased()
                .replacingOccurrences(of: " ", with: "")
                .replacingOccurrences(of: "#", with: "")
            let urlString = "https://www.royalealchemist.com/api/v1/officialapi/players/%20\(playerTag)/upcomingchests"
            
            request(urlString: urlString) { status in
                switch status {
                case .failed:
                    let entry = makeEntryWithUDValues(playerTag: playerTag)
                    
                    var nextUpdateDate = Calendar.current.date(byAdding: .minute, value: 60, to: Date())!
                    if let oldNextDateInMinutes = UD.sharedValue(
                        forKey: .chestsWidgetOldNextDateInMinutes(playerTag: playerTag)) as? Int {
                        nextUpdateDate = Calendar.current
                            .date(byAdding: .minute, value: oldNextDateInMinutes, to: Date())!
                    }
                    return completion(Timeline(entries: [entry], policy: .after(nextUpdateDate)))
                    
                case .succeeded(let playerChests):
                    let entry = ChestsEntry.init(date: Date(),
                                                 chests: playerChests,
                                                 playerTag: playerTag)
                    
                    let nextUpdateDate = nextDate(chests: playerChests, playerTag: playerTag)
                    saveToSharedUserDefaults(chests: playerChests, playerTag: playerTag)
                    return completion(Timeline(entries: [entry], policy: .after(nextUpdateDate)))
                }
            }
        }
    }
    
}

private func nextDate(chests: PlayerChests, playerTag: String) -> Date {
    
    let nextDate: (Calendar.Component, Int) -> Date = {
        let date = Calendar.current.date(byAdding: $0, value: $1, to: Date())!
        let timeInMinutes = $0 == .minute ? $1 : $1*60
        UD.sharedSet(timeInMinutes, forKey:
                        .chestsWidgetOldNextDateInMinutes(playerTag: playerTag))
        return date
    }
    
    if let oldFirstChest = UD.sharedValue(
        forKey: .chestsWidgetOldRetrievedChest(playerTag: playerTag)) as? String,
       let oldMaxIndex = UD.sharedValue(
        forKey: .chestsWidgetOldRequestMaxChestIndex(playerTag: playerTag)) as? Int,
       let oldNextDateInMinutes = UD.sharedValue(
        forKey: .chestsWidgetOldNextDateInMinutes(playerTag: playerTag)) as? Int,
       let currentFirstChest = chests.items.first?.name,
       let currentMaxIndex = chests.items.last?.index {
        
        if oldMaxIndex == currentMaxIndex &&
            oldFirstChest == currentFirstChest {
            
            return nextDate(.minute, oldNextDateInMinutes)
        }
        else if oldMaxIndex == currentMaxIndex+1 {
            switch oldFirstChest {
            case "Silver Chest": return nextDate(.minute, 90)
            case "Golden Chest": return nextDate(.hour, 4)
            case "Magical Chest": return nextDate(.hour, 6)
            case "Epic Chest": return nextDate(.hour, 6)
            case "Giant Chest": return nextDate(.hour, 6)
            case "Mega Lightning Chest": return nextDate(.hour, 12)
            case "Legendary Chest": return nextDate(.hour, 12)
            default: return nextDate(.minute, 45)
            }
        }
        
    }
    
    return nextDate(.minute, 90)
}

private func saveToSharedUserDefaults(chests: PlayerChests, playerTag: String) {
    if let firstChest = chests.items.first?.name,
       let maxIndex = chests.items.last?.index {
        
        UD.sharedSet(firstChest,
                     forKey: .chestsWidgetOldRetrievedChest(playerTag: playerTag))
        UD.sharedSet(maxIndex,
                     forKey: .chestsWidgetOldRequestMaxChestIndex(playerTag: playerTag))
    }
    
    UD.sharedSet(chests.items.map{ $0.index },
                 forKey: .chestsWidgetOldChestsIndices(playerTag: playerTag))
    UD.sharedSet(chests.items.map{ $0.name },
                 forKey: .chestsWidgetOldChestsNames(playerTag: playerTag))
}

private func makeEntryWithUDValues(playerTag: String) -> ChestsEntry {
    
    guard let names = UD.sharedValue(
            forKey: .chestsWidgetOldChestsNames(playerTag: playerTag)) as? [String],
          let indices = UD.sharedValue(
            forKey: .chestsWidgetOldChestsIndices(playerTag: playerTag)) as? [Int],
          indices.count >= 9,
          indices.count == names.count
    else {
        return emptyChestsEntry
    }
    
    return ChestsEntry.init(date: Date(),
                            chests:
                                .init(items: names.enumerated().map { nameIndex, nameValue in
                                    PlayerChests.Chest
                                        .init(index: indices[nameIndex],
                                              name: nameValue)
                                }))
}
