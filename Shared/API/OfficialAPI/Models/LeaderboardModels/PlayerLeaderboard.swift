import Foundation

private typealias PlayerLeaderboard = OAPI.Models.PlayerLeaderboard

extension OAPI.Models {
    struct PlayerLeaderboard: Codable, EmptyInitializable {
        @DecodeNilable var items: [Item] = .init()
    }
}

extension PlayerLeaderboard {
    struct Item: Codable, EmptyInitializable {
        @DecodeNilable var tag: String = .init()
        @DecodeNilable var name: String = .init()
        @DecodeNilable var expLevel: Int = .init()
        @DecodeNilable var trophies: Int = .init()
        @DecodeNilable var rank: Int = .init()
        @DecodeNilable var previousRank: Int = .init()
        @DecodeNilable var clan: Clan = .init()
        @DecodeNilable var arena: Arena = .init()
        
        func populate() -> Self {
            var model = self
            model.clan = model.clan.populate()
            return model
        }
    }
}

extension PlayerLeaderboard {
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

extension PlayerLeaderboard {
    struct Arena: Codable, EmptyInitializable {
        @DecodeNilable var id: Int = .init()
        @DecodeNilable var name: String = .init()
    }
}

extension PlayerLeaderboard: DecodeConvertible {
    func actionsToBeTakenAfterCompletion(datas: DatasEnvObj, arg: String) {
        datas.playerLeaderbaord.set(to: self.populate())
    }
}

extension PlayerLeaderboard {
    func populate() -> OfficialAPI.Models.PlayerLeaderboard {
        return .init(items: self.items.map{$0.populate()})
    }
}
