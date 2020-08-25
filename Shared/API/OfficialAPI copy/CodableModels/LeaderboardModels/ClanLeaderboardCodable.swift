//
//  ClanLeaderboard.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation

private typealias ClanLeaderboard = OAPI.CodableModels.ClanLeaderboard

extension OAPI.CodableModels {
    struct ClanLeaderboard: Codable {
        var items: [Item]? = .init()
    }
}

extension ClanLeaderboard {
    struct Item: Codable {
        var tag: String? = .init()
        var name: String? = .init()
        var rank: Int? = .init()
        var previousRank: Int? = .init()
        var location: Location? = .init()
        var clanScore: Int? = .init()
        var members: Int? = .init()
        var badgeId: Int? = .init()
    }
}

extension ClanLeaderboard {
    struct Location: Codable {
        var id: Int? = .init()
        var name: String? = .init()
        var isCountry: Bool? = .init()
        var countryCode: String? = .init()
    }
}

extension ClanLeaderboard: DecodeConvertible {
    func convertAfterDecode() -> OAPI.Models.ClanLeaderboard {
        
        let returni = OAPI.Models.ClanLeaderboard
            .init(items: self.items?.map { item in
                OAPI.Models.ClanLeaderboard.Item
                    .init(tag: item.tag ?? .init(),
                          name: item.name ?? .init(),
                          rank: item.rank ?? .init(),
                          previousRank: item.previousRank ?? .init(),
                          location: OfficialAPI.Models.ClanLeaderboard.Location
                            .init(id: item.location?.id ?? .init(),
                                  name: item.location?.name ?? .init(),
                                  isCountry: item.location?.isCountry ?? .init(),
                                  countryCode: item.location?.countryCode ?? .init()),
                          clanScore: item.clanScore ?? .init(),
                          members: item.members ?? .init(),
                          badgeId: item.badgeId ?? .init())
            } ?? [])
        
        return returni
    }
}
