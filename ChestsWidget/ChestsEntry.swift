import Foundation
import SwiftUI
import WidgetKit

struct ChestsEntry: TimelineEntry {
    var date: Date
    var chests: PlayerChests
    var playerTag: String?
    var widgetName: String?
    
    var relevance: TimelineEntryRelevance? {
        guard playerTag != nil else {
            return nil
        }
        
        var allRelevances = [TimelineEntryRelevance]()
        
        for chest in (chests.items.dropLast(max(chests.items.count - 9, 0))) {
            switch chest.name {
            case "Silver Chest": allRelevances.append(.init(score: 0, duration: 0))
            case "Golden Chest": allRelevances.append(.init(score: 20, duration: 60 * 5))
            case "Giant Chest": allRelevances.append(.init(score: 80, duration: 60 * 20))
            case "Magical Chest": allRelevances.append(.init(score: 130, duration: 60 * 33))
            case "Epic Chest": allRelevances.append(.init(score: 170, duration: 60 * 43))
            case "Legendary Chest": allRelevances.append(.init(score: 250, duration: 60 * 65))
            case "Mega Lightning Chest": allRelevances.append(.init(score: 450, duration: 60 * 150))
            default: break
            }
        }
        
        return allRelevances.max { $0.score > $1.score }
    }
}

struct PlayerChests: Codable {
    @DecodeNilable var items: [Chest] = .init()
}

extension PlayerChests {
    struct Chest: Codable {
        @DecodeNilable var index: Int = .init()
        @DecodeNilable var name: String = .init()
    }
}

let emptyChestsEntry = ChestsEntry(date: Date(), chests: chestsEmptyData)
let testChestsEntry = ChestsEntry(date: Date(),
                                  chests: chestsTestData,
                                  playerTag: "VPU8G",
                                  widgetName: "Ash's Chests")

extension String {
    func chestNameToChestImage() -> Image {
        switch self {
        case "Silver Chest": return Image("chest-silver")
        case "Golden Chest": return Image("chest-gold")
        case "Magical Chest": return Image("chest-magical")
        case "Epic Chest": return Image("chest-epic")
        case "Giant Chest": return Image("chest-giant")
        case "Mega Lightning Chest": return Image("chest-megalightning")
        case "Legendary Chest": return Image("chest-legendary")
        default: return Image("chest-wooden")
        }
    }
}

let chestsTestData = PlayerChests(
    items: [.init(index: (0), name: ("Silver Chest")),
            .init(index: (1), name: ("Golden Chest")),
            .init(index: (2), name: ("Silver Chest")),
            .init(index: (3), name: ("Silver Chest")),
            .init(index: (4), name: ("Golden Chest")),
            .init(index: (5), name: ("Silver Chest")),
            .init(index: (6), name: ("Silver Chest")),
            .init(index: (7), name: ("Silver Chest")),
            .init(index: (8), name: ("Silver Chest")),
            .init(index: (19), name: ("Magical Chest")),
            .init(index: (39), name: ("Epic Chest")),
            .init(index: (69), name: ("Giant Chest")),
            .init(index: (109), name: ("Mega Lightning Chest")),
            .init(index: (159), name: ("Legendary Chest"))]
)

let chestsEmptyData = PlayerChests(
    items: [.init(index: (0), name: ("Silver Chest")),
            .init(index: (0), name: ("Golden Chest")),
            .init(index: (0), name: ("Silver Chest")),
            .init(index: (0), name: ("Silver Chest")),
            .init(index: (0), name: ("Golden Chest")),
            .init(index: (0), name: ("Silver Chest")),
            .init(index: (0), name: ("Silver Chest")),
            .init(index: (0), name: ("Silver Chest")),
            .init(index: (0), name: ("Silver Chest")),
            .init(index: (0), name: ("Magical Chest")),
            .init(index: (0), name: ("Epic Chest")),
            .init(index: (0), name: ("Giant Chest")),
            .init(index: (0), name: ("Mega Lightning Chest")),
            .init(index: (0), name: ("Legendary Chest"))]
)
