//
//  ClanNameSearch.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation
import SwiftUI

private typealias ClanNameSearch = OAPI.CodableModels.ClanNameSearch

extension OAPI.CodableModels {
    struct ClanNameSearch: Codable, EmptyInitializable {
        @DecodeNilable var items: [Item] = .init()
    }
}

extension ClanNameSearch {
    struct Location: Codable, EmptyInitializable {
        @DecodeNilable var id: Int = .init()
        @DecodeNilable var name: String = .init()
        @DecodeNilable var isCountry: Bool = .init()
        @DecodeNilable var countryCode: String = .init()
    }
}

extension ClanNameSearch {
    struct Item: Codable, EmptyInitializable {
        @DecodeNilable var tag: String = .init()
        @DecodeNilable var name: String = .init()
        @DecodeNilable var type: String = .init()
        @DecodeNilable var badgeId: Int = .init()
        @DecodeNilable var clanScore: Int = .init()
        @DecodeNilable var clanWarTrophies: Int = .init()
        @DecodeNilable var location: Location = .init()
        @DecodeNilable var donationsPerWeek: Int = .init()
        @DecodeNilable var clanChestLevel: Int = .init()
        @DecodeNilable var clanChestMaxLevel: Int = .init()
        @DecodeNilable var members: Int = .init()
    }
}

extension ClanNameSearch: DecodeConvertible {
    func convertAndSave(datas: DatasEnvObj) {
        
        datas.clanNameSearch.wrappedValue = OAPI.Models.ClanNameSearch
            .init(items: self.items.map { item in
                OAPI.Models.ClanNameSearch.Item
                    .init(tag: item.tag,
                          name: item.name,
                          type: item.type,
                          badgeId: item.badgeId,
                          clanScore: item.clanScore,
                          clanWarTrophies: item.clanWarTrophies,
                          location: OfficialAPI.Models.ClanNameSearch.Location
                            .init(id: item.location.id,
                                  name: item.location.name,
                                  isCountry: item.location.isCountry,
                                  countryCode: item.location.countryCode),
                          donationsPerWeek: item.donationsPerWeek,
                          clanChestLevel: item.clanChestLevel,
                          clanChestMaxLevel: item.clanChestMaxLevel,
                          members: item.members)
            })
        
    }
}
