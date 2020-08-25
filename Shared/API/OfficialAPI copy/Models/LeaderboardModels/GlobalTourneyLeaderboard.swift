//
//  GlobalTOurneyLeaderboard.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation

private typealias GTLeaderboard = OAPI.Models.GTLeaderboard

extension OAPI.Models {
    typealias GTLeaderboard = GlobalTourneyLeaderboard
    
    struct GlobalTourneyLeaderboard {
        var items: [Item] = .init()
    }
}

extension GTLeaderboard {
    struct Item {
        var tag: String = .init()
        var name: String = .init()
        var wins: Int = .init()
        var losses: Int = .init()
        var rank: Int = .init()
        var previousRank: Int = .init()
        var clan: Clan = .init()
    }
}

extension GTLeaderboard {
    struct Clan {
        var name: String = .init()
        var tag: String = .init()
        var badgeId: Int = .init()
    }
}
