import Foundation
import SwiftUI
import WidgetKit

struct ChestsEntry: TimelineEntry {
    var date: Date
    var chests: PlayerChests
}

struct PlayerChests: Codable {
    var items: [Chest]? = .init()
}

extension PlayerChests {
    struct Chest: Codable {
        var index: Int? = .init()
        var name: String? = .init()
    }
}

let emptyChestsEntry = ChestsEntry(date: Date(), chests: chestsEmptyData)
let testChestsEntry = ChestsEntry(date: Date(), chests: chestsTestData)

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
    items: [.init(index: Optional(0),
                  name: Optional("Silver Chest")),
            .init(index: Optional(1),
                  name: Optional("Golden Chest")),
            .init(index: Optional(2),
                  name: Optional("Silver Chest")),
            .init(index: Optional(3),
                  name: Optional("Silver Chest")),
            .init(index: Optional(4),
                  name: Optional("Golden Chest")),
            .init(index: Optional(5),
                  name: Optional("Silver Chest")),
            .init(index: Optional(6),
                  name: Optional("Silver Chest")),
            .init(index: Optional(7),
                  name: Optional("Silver Chest")),
            .init(index: Optional(8),
                  name: Optional("Silver Chest")),
            .init(index: Optional(19),
                  name: Optional("Magical Chest")),
            .init(index: Optional(39),
                  name: Optional("Epic Chest")),
            .init(index: Optional(69),
                  name: Optional("Giant Chest")),
            .init(index: Optional(109),
                  name: Optional("Mega Lightning Chest")),
            .init(index: Optional(159),
                  name: Optional("Legendary Chest"))]
)

let chestsEmptyData = PlayerChests(
    items: [.init(index: Optional(0),
                  name: Optional("Silver Chest")),
            .init(index: Optional(0),
                  name: Optional("Golden Chest")),
            .init(index: Optional(0),
                  name: Optional("Silver Chest")),
            .init(index: Optional(0),
                  name: Optional("Silver Chest")),
            .init(index: Optional(0),
                  name: Optional("Golden Chest")),
            .init(index: Optional(0),
                  name: Optional("Silver Chest")),
            .init(index: Optional(0),
                  name: Optional("Silver Chest")),
            .init(index: Optional(0),
                  name: Optional("Silver Chest")),
            .init(index: Optional(0),
                  name: Optional("Silver Chest")),
            .init(index: Optional(0),
                  name: Optional("Magical Chest")),
            .init(index: Optional(0),
                  name: Optional("Epic Chest")),
            .init(index: Optional(0),
                  name: Optional("Giant Chest")),
            .init(index: Optional(0),
                  name: Optional("Mega Lightning Chest")),
            .init(index: Optional(0),
                  name: Optional("Legendary Chest"))]
)
