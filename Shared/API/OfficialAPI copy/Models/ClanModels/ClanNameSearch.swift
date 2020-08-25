//
//  ClanNameSearch.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation

private typealias ClanNameSearch = OAPI.Models.ClanNameSearch

extension OAPI.Models {
    struct ClanNameSearch {
        var items: [Item] = .init()
    }
}

extension ClanNameSearch {
    struct Location {
        var id: Int = .init()
        var name: String = .init()
        var isCountry: Bool = .init()
        var countryCode: String = .init()
    }
}

extension ClanNameSearch {
    struct Item {
        var tag: String = .init()
        var name: String = .init()
        var type: String = .init()
        var badgeId: Int = .init()
        var clanScore: Int = .init()
        var clanWarTrophies: Int = .init()
        var location: Location = .init()
        var donationsPerWeek: Int = .init()
        var clanChestLevel: Int = .init()
        var clanChestMaxLevel: Int = .init()
        var members: Int = .init()
    }
}

