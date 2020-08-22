import Foundation

private typealias GTLeaderboard = OAPI.Models.GTLeaderboard

extension OAPI.Models {
    typealias GTLeaderboard = GlobalTourneyLeaderboard
    
    struct GlobalTourneyLeaderboard: Codable, EmptyInitializable {
        @DecodeNilable var items: [Item] = .init()
    }
}

extension GTLeaderboard {
    struct Item: Codable, EmptyInitializable {
        @DecodeNilable var tag: String = .init()
        @DecodeNilable var name: String = .init()
        @DecodeNilable var wins: Int = .init()
        @DecodeNilable var losses: Int = .init()
        @DecodeNilable var rank: Int = .init()
        @DecodeNilable var previousRank: Int = .init()
        @DecodeNilable var clan: Clan = .init()
        
        func populate() -> Self {
            var model = self
            model.clan = model.clan.populate()
            return model
        }
    }
}

extension GTLeaderboard {
    struct Clan: Codable, EmptyInitializable {
        @DecodeNilable var tag: String = .init()
        @DecodeNilable var name: String = "no clan"
        @DecodeNilable var badgeId: Int = .init()
        @DecodeNilable var badgeName: String = "no_clan"
        
        func populate() -> Self {
            return .init(tag: self.tag,
                         name: self.name,
                         badgeId: self.badgeId,
                         badgeName: Funcs.Clan.badgeName(badgeId: self.badgeId))
        }
    }
}

extension GTLeaderboard: DecodeConvertible {
    func actionsToBeTakenAfterCompletion(datas: DatasEnvObj, arg: String) {
        datas.gtLeaderbord.set(to: self.populate())
    }
}

extension GTLeaderboard {
    func populate() -> OfficialAPI.Models.GlobalTourneyLeaderboard {
        return .init(items: self.items.map{$0.populate()})
    }
}
