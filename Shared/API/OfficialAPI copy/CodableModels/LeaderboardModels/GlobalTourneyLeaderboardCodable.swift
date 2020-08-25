//
//  GlobalTOurneyLeaderboard.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation

private typealias GTLeaderboard = OAPI.CodableModels.GTLeaderboard

extension OAPI.CodableModels {
    typealias GTLeaderboard = GlobalTourneyLeaderboard
    
    struct GlobalTourneyLeaderboard: Codable {
        var items: [Item]? = .init()
    }
}

extension GTLeaderboard {
    struct Item: Codable {
        var tag: String? = .init()
        var name: String? = .init()
        var wins: Int? = .init()
        var losses: Int? = .init()
        var rank: Int? = .init()
        var previousRank: Int? = .init()
        var clan: Clan? = .init()
    }
}

extension GTLeaderboard {
    struct Clan: Codable {
        var name: String? = .init()
        var tag: String? = .init()
        var badgeId: Int? = .init()
    }
}

extension GTLeaderboard: DecodeConvertible {
    func convertAfterDecode() -> OAPI.Models.GTLeaderboard {
        
        let returni = OAPI.Models.GTLeaderboard
            .init(items: self.items?.map { item in
                OfficialAPI.Models.GlobalTourneyLeaderboard.Item
                    .init(tag: item.tag ?? .init(),
                          name: item.name ?? .init(),
                          wins: item.wins ?? .init(),
                          losses: item.losses ?? .init(),
                          rank: item.rank ?? .init(),
                          previousRank: item.previousRank ?? .init(),
                          clan: OfficialAPI.Models.GlobalTourneyLeaderboard.Clan
                            .init(name: item.clan?.name ?? .init(),
                                  tag: item.clan?.tag ?? .init(),
                                  badgeId: item.clan?.badgeId ?? .init()))
            } ?? [])
        
        return returni
    }
}
