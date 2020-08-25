//
//  PlayerBattles.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation
import SwiftUI

private typealias PlayerBattle = OAPI.CodableModels.PlayerBattle

extension OAPI.CodableModels {
    struct PlayerBattle: Codable, EmptyInitializable {
//        @DecodeNilable var battles: [Battle] = .init()
        
        @DecodeNilable var type: String = .init()
        @DecodeNilable var battleTime: String = .init()
        @DecodeNilable var isLadderTournament: Bool = .init()
        @DecodeNilable var arena: Arena = .init()
        @DecodeNilable var gameMode: GameMode = .init()
        @DecodeNilable var deckSelection: String = .init()
        @DecodeNilable var team: [Battler] = .init()
        @DecodeNilable var opponent: [Battler] = .init()
        
//        enum CodingKeys: String, CodingKey {
//            case battles = ""
//        }
    }
}

//extension PlayerBattles {
//    struct Battle: Codable, EmptyInitializable {
//        @DecodeNilable var type: String = .init()
//        @DecodeNilable var battleTime: String = .init()
//        @DecodeNilable var isLadderTournament: Bool = .init()
//        @DecodeNilable var arena: Arena = .init()
//        @DecodeNilable var gameMode: GameMode = .init()
//        @DecodeNilable var deckSelection: String = .init()
//        @DecodeNilable var team: [Battler] = .init()
//        @DecodeNilable var opponent: [Battler] = .init()
//    }
//}

extension PlayerBattle {
    struct Card: Codable, EmptyInitializable {
        @DecodeNilable var name: String = .init()
        @DecodeNilable var id: Int = .init()
        @DecodeNilable var level: Int = .init()
        @DecodeNilable var maxLevel: Int = .init()
        @DecodeNilable var count: Int = .init()
        @DecodeNilable var iconUrls: IconUrls = .init()
    }
}

extension PlayerBattle {
    struct IconUrls: Codable, EmptyInitializable {
        @DecodeNilable var medium: String = .init()
    }
}

extension PlayerBattle {
    struct Clan: Codable, EmptyInitializable {
        @DecodeNilable var tag: String = .init()
        @DecodeNilable var name: String = .init()
        @DecodeNilable var badgeId: Int = .init()
    }
}

extension PlayerBattle {
    struct Arena: Codable, EmptyInitializable {
        @DecodeNilable var id: Int = .init()
        @DecodeNilable var name: String = .init()
    }
}

extension PlayerBattle {
    struct GameMode: Codable, EmptyInitializable {
        @DecodeNilable var id: Int = .init()
        @DecodeNilable var name: String = .init()
    }
}

extension PlayerBattle {
    struct Battler: Codable, EmptyInitializable {
        @DecodeNilable var tag: String = .init()
        @DecodeNilable var name: String = .init()
        @DecodeNilable var startingTrophies: Int = .init()
        @DecodeNilable var trophyChange: Int = .init()
        @DecodeNilable var crowns: Int = .init()
        @DecodeNilable var clan: Clan = .init()
        @DecodeNilable var cards: [Card] = .init()
    }
}

extension Array: DecodeConvertible where Element == OAPI.CodableModels.PlayerBattle {
    func convertAndSave(datas: DatasEnvObj) {
        typealias PlayerBattle = OAPI.Models.PlayerBattle
        
        datas.playerBattles.wrappedValue = self.map { battle in
            PlayerBattle
                .init(type: battle.type,
                      battleTime: battle.battleTime,
                      isLadderTournament: battle.isLadderTournament,
                      arena: PlayerBattle.Arena
                        .init(id: battle.arena.id,
                              name: battle.arena.name),
                      gameMode: PlayerBattle.GameMode
                        .init(id: battle.gameMode.id,
                              name: battle.gameMode.name),
                      deckSelection: battle.deckSelection,
                      team: battle.team.map{ battler in
                        PlayerBattle.Battler
                            .init(tag: battler.tag,
                                  name: battler.name,
                                  startingTrophies: battler.startingTrophies,
                                  trophyChange: battler.trophyChange,
                                  crowns: battler.crowns,
                                  clan: PlayerBattle.Clan
                                    .init(tag: battler.clan.tag,
                                          name: battler.clan.name,
                                          badgeId: battler.clan.badgeId),
                                  cards: battler.cards.map { card in
                                    PlayerBattle.Card
                                        .init(name: card.name,
                                              id: card.id,
                                              level: card.level,
                                              maxLevel: card.maxLevel,
                                              count: card.count,
                                              iconUrls: .init(medium: card.iconUrls.medium))
                                  })
                      },
                      opponent: battle.opponent.map{ battler in
                        PlayerBattle.Battler
                            .init(tag: battler.tag,
                                  name: battler.name,
                                  startingTrophies: battler.startingTrophies,
                                  trophyChange: battler.trophyChange,
                                  crowns: battler.crowns,
                                  clan: PlayerBattle.Clan
                                    .init(tag: battler.clan.tag,
                                          name: battler.clan.name,
                                          badgeId: battler.clan.badgeId),
                                  cards: battler.cards.map { card in
                                    PlayerBattle.Card
                                        .init(name: card.name,
                                              id: card.id,
                                              level: card.level,
                                              maxLevel: card.maxLevel,
                                              count: card.count,
                                              iconUrls: .init(medium: card.iconUrls.medium))
                                  })
                      })
        }
        
    }
}
