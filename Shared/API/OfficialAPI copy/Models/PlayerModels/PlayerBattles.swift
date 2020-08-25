//
//  PlayerBattles.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation

private typealias PlayerBattles = OAPI.Models.PlayerBattles

extension OAPI.Models {
    struct PlayerBattles {
        var battles: [Battle] = .init()
        
        enum CodingKeys: String, CodingKey {
            case battles = ""
        }
    }
}

extension PlayerBattles {
    struct Battle {
        var type: String = .init()
        var battleTime: String = .init()
        var isLadderTournament: Bool = .init()
        var arena: Arena = .init()
        var gameMode: GameMode = .init()
        var deckSelection: String = .init()
        var team: [Battler] = .init()
        var opponent: [Battler] = .init()
    }
}

extension PlayerBattles {
    struct Card {
        var name: String = .init()
        var id: Int = .init()
        var level: Int = .init()
        var maxLevel: Int = .init()
        var count: Int = .init()
        var iconUrls: IconUrls = .init()
    }
}

extension PlayerBattles {
    struct IconUrls {
        var medium: String = .init()
    }
}

extension PlayerBattles {
    struct Clan {
        var tag: String = .init()
        var name: String = .init()
        var badgeId: Int = .init()
    }
}

extension PlayerBattles {
    struct Arena {
        var id: Int = .init()
        var name: String = .init()
    }
}

extension PlayerBattles {
    struct GameMode {
        var id: Int = .init()
        var name: String = .init()
    }
}

extension PlayerBattles {
    struct Battler {
        var tag: String = .init()
        var name: String = .init()
        var startingTrophies: Int = .init()
        var trophyChange: Int = .init()
        var crowns: Int = .init()
        var clan: Clan = .init()
        var cards: [Card] = .init()
    }
}
