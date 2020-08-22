import Foundation

private typealias ClanLeaderboard = OAPI.Models.ClanLeaderboard

extension OAPI.Models {
    struct ClanLeaderboard: Codable, EmptyInitializable {
        enum ClanMode: String, Codable, EmptyInitializable {
            
            case clans = "clans"
            case warClans = "warClans"
            
            init() { self = .clans }
        }
        
        @DecodeNilable var items: [Item] = .init()
        @DecodeNilable var mode: ClanMode = .clans
    }
}

extension ClanLeaderboard {
    struct Item: Codable, EmptyInitializable {
        @DecodeNilable var tag: String = .init()
        @DecodeNilable var name: String = .init()
        @DecodeNilable var rank: Int = .init()
        @DecodeNilable var previousRank: Int = .init()
        @DecodeNilable var location: Location = .init()
        @DecodeNilable var clanScore: Int = .init()
        @DecodeNilable var members: Int = .init()
        @DecodeNilable var badgeId: Int = .init()
        @DecodeNilable var badgeName: String = .init()
        
        func populate() -> Self {
            var model = self
            model.badgeName = Funcs.Clan.badgeName(badgeId: self.badgeId)
            return model
        }
    }
}

extension ClanLeaderboard {
    struct Location: Codable, EmptyInitializable {
        @DecodeNilable var id: Int = .init()
        @DecodeNilable var name: String = .init()
        @DecodeNilable var isCountry: Bool = .init()
        @DecodeNilable var countryCode: String = .init()
    }
}

extension ClanLeaderboard: DecodeConvertible {
    func actionsToBeTakenAfterCompletion(datas: DatasEnvObj, arg: String) {
        let mode: ClanMode = arg.contains("clanwars") ? .warClans : .clans
        var populated = self.populate()
        populated.mode = mode
        datas.clanLeaderboard.set(to: populated)
    }
}

extension ClanLeaderboard {
    func populate() -> OfficialAPI.Models.ClanLeaderboard {
        return .init(items: self.items.map{$0.populate()})
    }
}
