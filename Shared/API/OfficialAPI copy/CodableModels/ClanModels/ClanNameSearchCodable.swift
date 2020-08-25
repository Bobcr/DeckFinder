//
//  ClanNameSearch.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation

private typealias ClanNameSearch = OAPI.CodableModels.ClanNameSearch

extension OAPI.CodableModels {
    struct ClanNameSearch: Codable {
        var items: [Item]? = .init()
    }
}

extension ClanNameSearch {
    struct Location: Codable {
        var id: Int? = .init()
        var name: String? = .init()
        var isCountry: Bool? = .init()
        var countryCode: String? = .init()
    }
}

extension ClanNameSearch {
    struct Item: Codable {
        var tag: String? = .init()
        var name: String? = .init()
        var type: String? = .init()
        var badgeId: Int? = .init()
        var clanScore: Int? = .init()
        var clanWarTrophies: Int? = .init()
        var location: Location? = .init()
        var donationsPerWeek: Int? = .init()
        var clanChestLevel: Int? = .init()
        var clanChestMaxLevel: Int? = .init()
        var members: Int? = .init()
    }
}

extension ClanNameSearch: DecodeConvertible {
    func convertAfterDecode() -> OAPI.Models.ClanNameSearch {
        
        let returni = OAPI.Models.ClanNameSearch
            .init(items: self.items?.map { item in
                OAPI.Models.ClanNameSearch.Item
                    .init(tag: item.tag ?? .init(),
                          name: item.name ?? .init(),
                          type: item.type ?? .init(),
                          badgeId: item.badgeId ?? .init(),
                          clanScore: item.clanScore ?? .init(),
                          clanWarTrophies: item.clanWarTrophies ?? .init(),
                          location: OfficialAPI.Models.ClanNameSearch.Location
                            .init(id: item.location?.id ?? .init(),
                                  name: item.location?.name ?? .init(),
                                  isCountry: item.location?.isCountry ?? .init(),
                                  countryCode: item.location?.countryCode ?? .init()),
                          donationsPerWeek: item.donationsPerWeek ?? .init(),
                          clanChestLevel: item.clanChestLevel ?? .init(),
                          clanChestMaxLevel: item.clanChestMaxLevel ?? .init(),
                          members: item.members ?? .init())
            } ?? [])
        
        return returni
    }
}
