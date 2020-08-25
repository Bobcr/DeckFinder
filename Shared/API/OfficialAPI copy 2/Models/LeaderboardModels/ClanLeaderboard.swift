//
//  ClanLeaderboard.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation

private typealias ClanLeaderboard = OAPI.Models.ClanLeaderboard

extension OAPI.Models {
    struct ClanLeaderboard {
        var items: [Item] = .init()
    }
}

extension ClanLeaderboard {
    struct Item {
        var tag: String = .init()
        var name: String = .init()
        var rank: Int = .init()
        var previousRank: Int = .init()
        var location: Location = .init()
        var clanScore: Int = .init()
        var members: Int = .init()
        var badgeId: Int = .init()
    }
}

extension ClanLeaderboard {
    struct Location {
        var id: Int = .init()
        var name: String = .init()
        var isCountry: Bool = .init()
        var countryCode: String = .init()
    }
}
