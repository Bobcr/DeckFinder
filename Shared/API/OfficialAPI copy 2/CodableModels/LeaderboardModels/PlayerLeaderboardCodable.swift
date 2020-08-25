//
//  PlayerLeaderboard.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation
import SwiftUI

private typealias PlayerLeaderboard = OAPI.CodableModels.PlayerLeaderboard

extension OAPI.CodableModels {
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
    }
}

extension PlayerLeaderboard {
    struct Clan: Codable, EmptyInitializable {
        @DecodeNilable var tag: String = .init()
        @DecodeNilable var name: String = .init()
        @DecodeNilable var badgeId: Int = .init()
    }
}

extension PlayerLeaderboard {
    struct Arena: Codable, EmptyInitializable {
        @DecodeNilable var id: Int = .init()
        @DecodeNilable var name: String = .init()
    }
}

extension PlayerLeaderboard: DecodeConvertible {
    func convertAndSave(datas: DatasEnvObj) {
        
        datas.playerLeaderbaord.wrappedValue = OAPI.Models.PlayerLeaderboard
            .init(items: self.items.map { item in
                OfficialAPI.Models.PlayerLeaderboard.Item
                    .init(tag: item.tag,
                          name: item.name,
                          expLevel: item.expLevel,
                          trophies: item.trophies,
                          rank: item.rank,
                          previousRank: item.previousRank,
                          clan: OfficialAPI.Models.PlayerLeaderboard.Clan
                            .init(tag: item.clan.tag,
                                  name: item.clan.name,
                                  badgeId: item.clan.badgeId),
                          arena: OfficialAPI.Models.PlayerLeaderboard.Arena
                            .init(id: item.arena.id,
                                  name: item.arena.name))
            })
        
    }
}
