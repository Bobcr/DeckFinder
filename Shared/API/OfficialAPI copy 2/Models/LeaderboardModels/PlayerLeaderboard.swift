//
//  PlayerLeaderboard.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation

private typealias PlayerLeaderboard = OAPI.Models.PlayerLeaderboard

extension OAPI.Models {
    struct PlayerLeaderboard {
        var items: [Item] = .init()
    }
}

extension PlayerLeaderboard {
    struct Item {
        var tag: String = .init()
        var name: String = .init()
        var expLevel: Int = .init()
        var trophies: Int = .init()
        var rank: Int = .init()
        var previousRank: Int = .init()
        var clan: Clan = .init()
        var arena: Arena = .init()
    }
}

extension PlayerLeaderboard {
    struct Clan {
        var tag: String = .init()
        var name: String = .init()
        var badgeId: Int = .init()
    }
}

extension PlayerLeaderboard {
    struct Arena {
        var id: Int = .init()
        var name: String = .init()
    }
}

