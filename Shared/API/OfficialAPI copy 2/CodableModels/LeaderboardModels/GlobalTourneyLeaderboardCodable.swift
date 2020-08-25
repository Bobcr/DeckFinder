//
//  GlobalTOurneyLeaderboard.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation
import SwiftUI

private typealias GTLeaderboard = OAPI.CodableModels.GTLeaderboard

extension OAPI.CodableModels {
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
    }
}

extension GTLeaderboard {
    struct Clan: Codable, EmptyInitializable {
        @DecodeNilable var name: String = .init()
        @DecodeNilable var tag: String = .init()
        @DecodeNilable var badgeId: Int = .init()
    }
}

extension GTLeaderboard: DecodeConvertible {
    func convertAndSave(datas: DatasEnvObj) {
        
        datas.gtLeaderbord.wrappedValue = OAPI.Models.GTLeaderboard
            .init(items: self.items.map { item in
                OfficialAPI.Models.GlobalTourneyLeaderboard.Item
                    .init(tag: item.tag,
                          name: item.name,
                          wins: item.wins,
                          losses: item.losses,
                          rank: item.rank,
                          previousRank: item.previousRank,
                          clan: OfficialAPI.Models.GlobalTourneyLeaderboard.Clan
                            .init(name: item.clan.name,
                                  tag: item.clan.tag,
                                  badgeId: item.clan.badgeId))
            })
        
    }
}
