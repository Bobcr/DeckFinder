//
//  PlayerBattles.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation

private typealias PlayerBattle = OAPI.Models.PlayerBattle

extension OAPI.Models {
    struct PlayerBattle {
        var type: String = .init()
        var battleTime: String = .init()
        var isLadderTournament: Bool = .init()
        var arena: Arena = .init()
        var gameMode: GameMode = .init()
        var deckSelection: String = .init()
        var team: [Battler] = .init()
        var opponent: [Battler] = .init()
        
//        var battles: [Battle] = .init()
        
//        enum CodingKeys: String, CodingKey {
//            case battles = ""
//        }
    }
}

//extension PlayerBattles {
//    struct Battle {
//        var type: String = .init()
//        var battleTime: String = .init()
//        var isLadderTournament: Bool = .init()
//        var arena: Arena = .init()
//        var gameMode: GameMode = .init()
//        var deckSelection: String = .init()
//        var team: [Battler] = .init()
//        var opponent: [Battler] = .init()
//    }
//}

extension PlayerBattle {
    struct Card {
        var name: String = .init()
        var id: Int = .init()
        var level: Int = .init()
        var maxLevel: Int = .init()
        var count: Int = .init()
        var iconUrls: IconUrls = .init()
    }
}

extension PlayerBattle {
    struct IconUrls {
        var medium: String = .init()
    }
}

extension PlayerBattle {
    struct Clan {
        var tag: String = .init()
        var name: String = .init()
        var badgeId: Int = .init()
    }
}

extension PlayerBattle {
    struct Arena {
        var id: Int = .init()
        var name: String = .init()
    }
}

extension PlayerBattle {
    struct GameMode {
        var id: Int = .init()
        var name: String = .init()
    }
}

extension PlayerBattle {
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
