import Foundation

extension RAAPI.Models {
    struct Leaderboards {
        var items: [Item] = []
        var mode: LeaderboardsBaseView.Mode = .starpoints
    }
}

extension RAAPI.Models.Leaderboards {
    struct DecodeItem: Codable {
        var name = ""
        var tag = ""
        var clanName = ""
        var clanTag = ""
        var clanBadgeId = 0
        var xpLevel = 0
        var rankValue = 0
    }
    
    struct Item: Codable {
        var name = ""
        var tag = ""
        var clanName = ""
        var clanTag = ""
        var clanBadgeName = ""
        var xpLevel = 0
        var rankValue = 0
    }
}

extension Array where Element == RAAPI.Models.Leaderboards.DecodeItem {
    func convertToLeaderboards(arg: String) -> RAAPI.Models.Leaderboards {
        
        let urlComponents = arg.components(separatedBy: "/")
        guard urlComponents.count-2 >= 0 else {
            return .init()
        }
        let modeEndpointString = urlComponents[urlComponents.count-2]
        
        var mode: LeaderboardsBaseView.Mode? = nil
        let allCases = LeaderboardsBaseView.Mode.allCases
        
        for oneCase in allCases {
            if oneCase.apiEndpointValue == modeEndpointString {
                mode = oneCase
                break
            }
        }
        
        guard let newMode = mode else {
            return .init()
        }
        
        let newItems = self.map {
            return RAAPI.Models.Leaderboards.Item(name: $0.name,
                                                  tag: $0.tag,
                                                  clanName: $0.clanName,
                                                  clanTag: $0.clanTag,
                                                  clanBadgeName: Funcs.Clan.badgeName(badgeId: $0.clanBadgeId),
                                                  xpLevel: $0.xpLevel,
                                                  rankValue: $0.rankValue)
        }
        
        return RAAPI.Models.Leaderboards.init(items: newItems,
                                              mode: newMode)
    }
}

extension RAAPI.Models.Leaderboards {
    static let testData = Self(items: [Self.Item(name: "Eric",
                                                         tag: "2LGRUV2Y8",
                                                         clanName: "賜哥正仆街",
                                                         clanTag: "8YLYG2L",
                                                         clanBadgeName: "A_Char_Goblin_01",
                                                         xpLevel: 13,
                                                         rankValue: 1756),
                                               Self.Item(name: "賣女孩的小火柴",
                                                         tag: "98R8L2",
                                                         clanName: "☆TAIWAN☆",
                                                         clanTag: "98UR2CL",
                                                         clanBadgeName: "Crown_04",
                                                         xpLevel: 13,
                                                         rankValue: 1731),
                                               Self.Item(name: "hinmak",
                                                         tag: "2Q9U80P9U",
                                                         clanName: "Tonyfamily",
                                                         clanTag: "2GRV9C",
                                                         clanBadgeName: "A_Char_Goblin_01",
                                                         xpLevel: 13,
                                                         rankValue: 1650),
                                               Self.Item(name: "EC1119",
                                                         tag: "20J8C8YU",
                                                         clanName: "",
                                                         clanTag: "",
                                                         clanBadgeName: "no_clan",
                                                         xpLevel: 13,
                                                         rankValue: 1629),
                                               Self.Item(name: "Ada♥️",
                                                         tag: "90L8C8UC",
                                                         clanName: "Gainile Ametite",
                                                         clanTag: "8LUV8UUR",
                                                         clanBadgeName: "Diamond_Star_01",
                                                         xpLevel: 13,
                                                         rankValue: 1576),
                                               Self.Item(name: "Alamin",
                                                         tag: "G080RJ90",
                                                         clanName: "ANGRY GAMER",
                                                         clanTag: "JYR82QY",
                                                         clanBadgeName: "Moon_03",
                                                         xpLevel: 13,
                                                         rankValue: 1559),
                                               Self.Item(name: "Kranses II",
                                                         tag: "2VJLR8JYP",
                                                         clanName: "#GermanArmy",
                                                         clanTag: "90LPVUU2",
                                                         clanBadgeName: "Skull_06",
                                                         xpLevel: 13,
                                                         rankValue: 1551),
                                               Self.Item(name: "Dimarik",
                                                         tag: "2V0GURJUR",
                                                         clanName: "Матрёшка",
                                                         clanTag: "VUJCQQG",
                                                         clanBadgeName: "flag_e_01",
                                                         xpLevel: 13,
                                                         rankValue: 1536),
                                               Self.Item(name: "패닉",
                                                         tag: "20P92LCCJ",
                                                         clanName: "",
                                                         clanTag: "",
                                                         clanBadgeName: "no_clan",
                                                         xpLevel: 12,
                                                         rankValue: 1497),
                                               Self.Item(name: "kocTeTpax",
                                                         tag: "82LLGQYJ2",
                                                         clanName: "Киев",
                                                         clanTag: "LY8UQ0Q",
                                                         clanBadgeName: "flag_m_02",
                                                         xpLevel: 13,
                                                         rankValue: 1496),
                                               Self.Item(name: "ryoma",
                                                         tag: "V0YULYJ",
                                                         clanName: "TWICE",
                                                         clanTag: "PGVPRCCC",
                                                         clanBadgeName: "Cherry_Blossom_01",
                                                         xpLevel: 13,
                                                         rankValue: 1487),
                                               Self.Item(name: "amir hossein",
                                                         tag: "22J9VJQ8L",
                                                         clanName: "malayer clan",
                                                         clanTag: "2GJ0U0PJ",
                                                         clanBadgeName: "A_Char_King_03",
                                                         xpLevel: 10,
                                                         rankValue: 1474),
                                               Self.Item(name: "Knuwoo",
                                                         tag: "Y8CU29VU",
                                                         clanName: "",
                                                         clanTag: "",
                                                         clanBadgeName: "no_clan",
                                                         xpLevel: 13,
                                                         rankValue: 1464),
                                               Self.Item(name: "still ill",
                                                         tag: "2R9L88L2",
                                                         clanName: "minty hippos",
                                                         clanTag: "PU98LLQ",
                                                         clanBadgeName: "Bamboo_01",
                                                         xpLevel: 13,
                                                         rankValue: 1451),
                                               Self.Item(name: "badboys",
                                                         tag: "8CQGGQ909",
                                                         clanName: "Captain Morgan",
                                                         clanTag: "8299U0LP",
                                                         clanBadgeName: "Clover_02",
                                                         xpLevel: 13,
                                                         rankValue: 1445),
                                               Self.Item(name: "5joli",
                                                         tag: "QQGPUCP",
                                                         clanName: "hazara united",
                                                         clanTag: "2RYLLUL",
                                                         clanBadgeName: "Sword_02",
                                                         xpLevel: 12,
                                                         rankValue: 1439),
                                               Self.Item(name: "5joli",
                                                         tag: "VCQLJP28",
                                                         clanName: "hazara united",
                                                         clanTag: "2RYLLUL",
                                                         clanBadgeName: "Sword_02",
                                                         xpLevel: 12,
                                                         rankValue: 1438),
                                               Self.Item(name: "William Wallace",
                                                         tag: "PPRPJ8Y9",
                                                         clanName: "Castors allumés",
                                                         clanTag: "8UR2J2L",
                                                         clanBadgeName: "flag_k_01",
                                                         xpLevel: 13,
                                                         rankValue: 1436),
                                               Self.Item(name: "Jayso",
                                                         tag: "2VQLJ80J8",
                                                         clanName: "German-Stars",
                                                         clanTag: "L09LP",
                                                         clanBadgeName: "Star_Shine_02",
                                                         xpLevel: 13,
                                                         rankValue: 1434),
                                               Self.Item(name: "αlphaa™☺️²",
                                                         tag: "2JCLRG9QC",
                                                         clanName: "",
                                                         clanTag: "",
                                                         clanBadgeName: "no_clan",
                                                         xpLevel: 13,
                                                         rankValue: 1433),
                                               Self.Item(name: "Nick",
                                                         tag: "2CP0UR0QG",
                                                         clanName: "",
                                                         clanTag: "",
                                                         clanBadgeName: "no_clan",
                                                         xpLevel: 11,
                                                         rankValue: 1426),
                                               Self.Item(name: "就现在",
                                                         tag: "V20YJY28",
                                                         clanName: "",
                                                         clanTag: "",
                                                         clanBadgeName: "no_clan",
                                                         xpLevel: 12,
                                                         rankValue: 1421),
                                               Self.Item(name: "Babu",
                                                         tag: "8QC982PG",
                                                         clanName: "Badge Of Mighty",
                                                         clanTag: "QVJ2QLP",
                                                         clanBadgeName: "Traditional_Star_05",
                                                         xpLevel: 13,
                                                         rankValue: 1401),
                                               Self.Item(name: "FunkmasterFlex",
                                                         tag: "R2ULUCG",
                                                         clanName: "",
                                                         clanTag: "",
                                                         clanBadgeName: "no_clan",
                                                         xpLevel: 12,
                                                         rankValue: 1399),
                                               Self.Item(name: "wallprobo",
                                                         tag: "YY92JRJQ",
                                                         clanName: "The Division",
                                                         clanTag: "8Y098J2",
                                                         clanBadgeName: "Traditional_Star_03",
                                                         xpLevel: 12,
                                                         rankValue: 1363),
                                               Self.Item(name: "お茶犬",
                                                         tag: "8LL0J09CC",
                                                         clanName: "",
                                                         clanTag: "",
                                                         clanBadgeName: "no_clan",
                                                         xpLevel: 12,
                                                         rankValue: 1362),
                                               Self.Item(name: "まさ",
                                                         tag: "2PGJG2GP",
                                                         clanName: "",
                                                         clanTag: "",
                                                         clanBadgeName: "no_clan",
                                                         xpLevel: 12,
                                                         rankValue: 1355),
                                               Self.Item(name: "KIMI",
                                                         tag: "99V9RYUL8",
                                                         clanName: "",
                                                         clanTag: "",
                                                         clanBadgeName: "no_clan",
                                                         xpLevel: 11,
                                                         rankValue: 1341)],
                                       mode: LeaderboardsBaseView.Mode.warDayWins)
    
}
