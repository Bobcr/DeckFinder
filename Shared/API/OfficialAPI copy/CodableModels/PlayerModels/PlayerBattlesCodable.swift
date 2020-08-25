//
//  PlayerBattles.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation

private typealias PlayerBattles = OAPI.CodableModels.PlayerBattles

extension OAPI.CodableModels {
    struct PlayerBattles: Codable {
        var battles: [Battle]? = .init()
        
        enum CodingKeys: String, CodingKey {
            case battles = ""
        }
    }
}

extension PlayerBattles {
    struct Battle: Codable {
        var type: String? = .init()
        var battleTime: String? = .init()
        var isLadderTournament: Bool? = .init()
        var arena: Arena? = .init()
        var gameMode: GameMode? = .init()
        var deckSelection: String? = .init()
        var team: [Battler]? = .init()
        var opponent: [Battler]? = .init()
    }
}

extension PlayerBattles {
    struct Card: Codable {
        var name: String? = .init()
        var id: Int? = .init()
        var level: Int? = .init()
        var maxLevel: Int? = .init()
        var count: Int? = .init()
        var iconUrls: IconUrls? = .init()
    }
}

extension PlayerBattles {
    struct IconUrls: Codable {
        var medium: String? = .init()
    }
}

extension PlayerBattles {
    struct Clan: Codable {
        var tag: String? = .init()
        var name: String? = .init()
        var badgeId: Int? = .init()
    }
}

extension PlayerBattles {
    struct Arena: Codable {
        var id: Int? = .init()
        var name: String? = .init()
    }
}

extension PlayerBattles {
    struct GameMode: Codable {
        var id: Int? = .init()
        var name: String? = .init()
    }
}

extension PlayerBattles {
    struct Battler: Codable {
        var tag: String? = .init()
        var name: String? = .init()
        var startingTrophies: Int? = .init()
        var trophyChange: Int? = .init()
        var crowns: Int? = .init()
        var clan: Clan? = .init()
        var cards: [Card]? = .init()
    }
}

extension PlayerBattles: DecodeConvertible {
    func convertAfterDecode() -> OAPI.Models.PlayerBattles {
        var returni = OAPI.Models.PlayerBattles()
        typealias PlayerBattles = OAPI.Models.PlayerBattles
        
        returni.battles = self.battles?.map { battle in
            PlayerBattles.Battle
                .init(type: battle.type ?? .init(),
                      battleTime: battle.battleTime ?? .init(),
                      isLadderTournament: battle.isLadderTournament ?? .init(),
                      arena: PlayerBattles.Arena
                        .init(id: battle.arena?.id ?? .init(),
                              name: battle.arena?.name ?? .init()),
                      gameMode: PlayerBattles.GameMode
                        .init(id: battle.gameMode?.id ?? .init(),
                              name: battle.gameMode?.name ?? .init()),
                      deckSelection: battle.deckSelection ?? .init(),
                      team: battle.team?.map{ battler in
                        PlayerBattles.Battler
                            .init(tag: battler.tag ?? .init(),
                                  name: battler.name ?? .init(),
                                  startingTrophies: battler.startingTrophies ?? .init(),
                                  trophyChange: battler.trophyChange ?? .init(),
                                  crowns: battler.crowns ?? .init(),
                                  clan: PlayerBattles.Clan
                                    .init(tag: battler.clan?.tag ?? .init(),
                                          name: battler.clan?.name ?? .init(),
                                          badgeId: battler.clan?.badgeId ?? .init()),
                                  cards: battler.cards?.map { card in
                                    PlayerBattles.Card
                                        .init(name: card.name ?? .init(),
                                              id: card.id ?? .init(),
                                              level: card.level ?? .init(),
                                              maxLevel: card.maxLevel ?? .init(),
                                              count: card.count ?? .init(),
                                              iconUrls: .init(medium: card.iconUrls?.medium ?? .init()))
                                  } ?? [])
                      } ?? [],
                      opponent: battle.opponent?.map{ battler in
                        PlayerBattles.Battler
                            .init(tag: battler.tag ?? .init(),
                                  name: battler.name ?? .init(),
                                  startingTrophies: battler.startingTrophies ?? .init(),
                                  trophyChange: battler.trophyChange ?? .init(),
                                  crowns: battler.crowns ?? .init(),
                                  clan: PlayerBattles.Clan
                                    .init(tag: battler.clan?.tag ?? .init(),
                                          name: battler.clan?.name ?? .init(),
                                          badgeId: battler.clan?.badgeId ?? .init()),
                                  cards: battler.cards?.map { card in
                                    PlayerBattles.Card
                                        .init(name: card.name ?? .init(),
                                              id: card.id ?? .init(),
                                              level: card.level ?? .init(),
                                              maxLevel: card.maxLevel ?? .init(),
                                              count: card.count ?? .init(),
                                              iconUrls: .init(medium: card.iconUrls?.medium ?? .init()))
                                  } ?? [])
                      } ?? [])
        } ?? []
        
        return returni
    }
}
