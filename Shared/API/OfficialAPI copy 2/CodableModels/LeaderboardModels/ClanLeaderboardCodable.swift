//
//  ClanLeaderboard.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation
import SwiftUI

private typealias ClanLeaderboard = OAPI.CodableModels.ClanLeaderboard

extension OAPI.CodableModels {
    struct ClanLeaderboard: Codable, EmptyInitializable {
        @DecodeNilable var items: [Item] = .init()
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
    func convertAndSave(datas: DatasEnvObj) {
        
        datas.clanLeaderboard.wrappedValue = OAPI.Models.ClanLeaderboard
            .init(items: self.items.map { item in
                OAPI.Models.ClanLeaderboard.Item
                    .init(tag: item.tag,
                          name: item.name,
                          rank: item.rank,
                          previousRank: item.previousRank,
                          location: OfficialAPI.Models.ClanLeaderboard.Location
                            .init(id: item.location.id,
                                  name: item.location.name,
                                  isCountry: item.location.isCountry,
                                  countryCode: item.location.countryCode),
                          clanScore: item.clanScore,
                          members: item.members,
                          badgeId: item.badgeId)
            })
        
    }
}
