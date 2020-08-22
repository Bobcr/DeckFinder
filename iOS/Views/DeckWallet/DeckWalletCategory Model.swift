import Foundation

struct DeckWalletCategory: Codable {
    var name: String
    var decks: [Deck]
    
    struct Deck: Codable, Equatable {
        static func == (lhs: DeckWalletCategory.Deck, rhs: DeckWalletCategory.Deck) -> Bool {
            lhs.name == rhs.name &&
                lhs.cards.sorted() == rhs.cards.sorted()
        }
        
        var name: String
        @DecodeNilable var avgElixirCost: String
        var cards: [String]
        
        init(name: String,
             avgElixirCost: String,
             cards: [String]) {
            
            self.name = name
            self.avgElixirCost = avgElixirCost
            self.cards = cards
        }
    }
}

enum DeckWalletMode: Equatable {
    case compact
    case expanded(columns: Int)
    
    func userDefaultable() -> String {
        switch self {
        case .compact: return "Compact"
        case .expanded(let columns): return "Expanded\(columns)"
        }
    }
    
    static func find(key userDefaultsKey: String) -> Self {
        if let lastChar = userDefaultsKey.last,
           let unwrappedInteger = Int(String(lastChar)) {
            
            return .expanded(columns: unwrappedInteger)
        }
        else {
            return .compact
        }
    }
}

let testCategories: [DeckWalletCategory] = [
    .init(name: "Default",
          decks: [
            .init(name: "",
                  avgElixirCost: "Avg Cost: 2.6",
                  cards: ["hog-rider", "musketeer", "skeletons", "ice-golem", "cannon", "the-log", "fireball", "ice-spirit"]),
            .init(name: "two point six",
                  avgElixirCost: "Avg Cost: 2.7",
                  cards: ["hog-rider", "musketeer", "skeletons", "archers", "cannon", "the-log", "fireball", "ice-spirit"]),
            .init(name: "two point seven",
                  avgElixirCost: "Avg Cost: 2.8",
                  cards: ["hog-rider", "musketeer", "skeletons", "barbarians", "cannon", "the-log", "fireball", "ice-spirit"]),
            .init(name: "two point eight",
                  avgElixirCost: "Avg Cost: 2.9",
                  cards: ["hog-rider", "musketeer", "skeletons", "golem", "cannon", "the-log", "fireball", "ice-spirit"]),
            .init(name: "",
                  avgElixirCost: "Avg Cost: 10",
                  cards: ["hog-rider", "musketeer", "skeletons", "rascals", "cannon", "the-log", "fireball", "ice-spirit"]),
            .init(name: "",
                  avgElixirCost: "Avg Cost: 10",
                  cards: ["hog-rider", "musketeer", "skeletons", "elixir-golem", "cannon", "the-log", "fireball", "ice-spirit"]),
            .init(name: "two point nine",
                  avgElixirCost: "Avg Cost: 10",
                  cards: ["hog-rider", "musketeer", "skeletons", "firecracker", "cannon", "the-log", "fireball", "ice-spirit"])
          ])
]
