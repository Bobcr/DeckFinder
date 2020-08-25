//
//  PlayerLeaderboard.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation

private typealias PlayerLeaderboard = OAPI.CodableModels.PlayerLeaderboard

extension OAPI.CodableModels {
    struct PlayerLeaderboard: Codable {
        var items: [Item]? = .init()
    }
}

extension PlayerLeaderboard {
    struct Item: Codable {
        var tag: String? = .init()
        var name: String? = .init()
        var expLevel: Int? = .init()
        var trophies: Int? = .init()
        var rank: Int? = .init()
        var previousRank: Int? = .init()
        var clan: Clan? = .init()
        var arena: Arena? = .init()
    }
}

extension PlayerLeaderboard {
    struct Clan: Codable {
        var tag: String? = .init()
        var name: String? = .init()
        var badgeId: Int? = .init()
    }
}

extension PlayerLeaderboard {
    struct Arena: Codable {
        var id: Int? = .init()
        var name: String? = .init()
    }
}

extension PlayerLeaderboard: DecodeConvertible {
    func convertAfterDecode() -> OAPI.Models.PlayerLeaderboard {
        
        let returni = OAPI.Models.PlayerLeaderboard
            .init(items: self.items?.map { item in
                OfficialAPI.Models.PlayerLeaderboard.Item
                    .init(tag: item.tag ?? .init(),
                          name: item.name ?? .init(),
                          expLevel: item.expLevel ?? .init(),
                          trophies: item.trophies ?? .init(),
                          rank: item.rank ?? .init(),
                          previousRank: item.previousRank ?? .init(),
                          clan: OfficialAPI.Models.PlayerLeaderboard.Clan
                            .init(tag: item.clan?.tag ?? .init(),
                                  name: item.clan?.name ?? .init(),
                                  badgeId: item.clan?.badgeId ?? .init()),
                          arena: OfficialAPI.Models.PlayerLeaderboard.Arena
                            .init(id: item.arena?.id ?? .init(),
                                  name: item.arena?.name ?? .init()))
            } ?? [])
        
        return returni
    }
}
