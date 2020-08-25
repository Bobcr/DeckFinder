//
//  PlayerProfile.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation
import SwiftUI

private typealias PlayerProfile = OAPI.CodableModels.PlayerProfile

extension OAPI.CodableModels {
    struct PlayerProfile: Codable, EmptyInitializable {
        
        @DecodeNilable var tag: String = .init()
        @DecodeNilable var name: String = .init()
        @DecodeNilable var expLevel: Int = .init()
        @DecodeNilable var trophies: Int = .init()
        @DecodeNilable var bestTrophies: Int = .init()
        @DecodeNilable var wins: Int = .init()
        @DecodeNilable var losses: Int = .init()
        @DecodeNilable var battleCount: Int = .init()
        @DecodeNilable var threeCrownWins: Int = .init()
        @DecodeNilable var challengeCardsWon: Int = .init()
        @DecodeNilable var challengeMaxWins: Int = .init()
        @DecodeNilable var tournamentCardsWon: Int = .init()
        @DecodeNilable var tournamentBattleCount: Int = .init()
        @DecodeNilable var role: String = .init()
        @DecodeNilable var donations: Int = .init()
        @DecodeNilable var donationsReceived: Int = .init()
        @DecodeNilable var totalDonations: Int = .init()
        @DecodeNilable var warDayWins: Int = .init()
        @DecodeNilable var clanCardsCollected: Int = .init()
        @DecodeNilable var clan: Clan = .init()
        @DecodeNilable var arena: Arena = .init()
        @DecodeNilable var leagueStatistics: LeagueStatistics = .init()
        @DecodeNilable var badges: [Badge] = .init()
        @DecodeNilable var achievements: [Achievement] = .init()
        @DecodeNilable var cards: [Card] = .init()
        @DecodeNilable var currentDeck: [Card] = .init()
        @DecodeNilable var currentFavouriteCard: Card = .init()
        
    }
}

extension PlayerProfile {
    struct Card: Codable, EmptyInitializable {
        @DecodeNilable var name: String = .init()
        @DecodeNilable var id: Int = .init()
        @DecodeNilable var level: Int = .init()
        @DecodeNilable var maxLevel: Int = .init()
        @DecodeNilable var count: Int = .init()
        @DecodeNilable var iconUrls: IconUrls = .init()
    }
}

extension PlayerProfile {
    struct Achievement: Codable, EmptyInitializable {
        @DecodeNilable var name: String = .init()
        @DecodeNilable var stars: Int = .init()
        @DecodeNilable var value: Int = .init()
        @DecodeNilable var target: Int = .init()
        @DecodeNilable var info: String = .init()
        @DecodeNilable var completionInfo: String = .init()
    }
}

extension PlayerProfile {
    struct IconUrls: Codable, EmptyInitializable {
        @DecodeNilable var medium: String = .init()
    }
}

extension PlayerProfile {
    struct Badge: Codable, EmptyInitializable {
        @DecodeNilable var name: String = .init()
        @DecodeNilable var progress: Int = .init()
    }
}

extension PlayerProfile {
    struct Clan: Codable, EmptyInitializable {
        @DecodeNilable var tag: String = .init()
        @DecodeNilable var name: String = .init()
        @DecodeNilable var badgeId: Int = .init()
    }
}

extension PlayerProfile {
    struct Arena: Codable, EmptyInitializable {
        @DecodeNilable var id: Int = .init()
        @DecodeNilable var name: String = .init()
    }
}

extension PlayerProfile {
    struct LeagueStatistics: Codable, EmptyInitializable {
        @DecodeNilable var currentSeason: SeasonStats = .init()
        @DecodeNilable var previousSeason: SeasonStats = .init()
        @DecodeNilable var bestSeason: SeasonStats = .init()
    }
}

extension PlayerProfile {
    struct SeasonStats: Codable, EmptyInitializable {
        @DecodeNilable var id: String = .init()
        @DecodeNilable var trophies: Int = .init()
        @DecodeNilable var bestTrophies: Int = .init()
        @DecodeNilable var rank: Int = .init()
    }
}

extension PlayerProfile: DecodeConvertible {
    func convertAndSave(datas: DatasEnvObj) {
        var playerProfile = OAPI.Models.PlayerProfile()
        
        playerProfile.tag = self.tag
        playerProfile.name = self.name
        playerProfile.expLevel = self.expLevel
        playerProfile.trophies = self.trophies
        playerProfile.bestTrophies = self.bestTrophies
        playerProfile.wins = self.wins
        playerProfile.losses = self.losses
        playerProfile.battleCount = self.battleCount
        playerProfile.threeCrownWins = self.threeCrownWins
        playerProfile.challengeCardsWon = self.challengeCardsWon
        playerProfile.challengeMaxWins = self.challengeMaxWins
        playerProfile.tournamentCardsWon = self.tournamentCardsWon
        playerProfile.tournamentBattleCount = self.tournamentBattleCount
        playerProfile.role = self.role
        playerProfile.donations = self.donations
        playerProfile.donationsReceived = self.donationsReceived
        playerProfile.totalDonations = self.totalDonations
        playerProfile.warDayWins = self.warDayWins
        playerProfile.clanCardsCollected = self.clanCardsCollected
        playerProfile.clan = .init(tag: self.clan.tag,
                             name: self.clan.name,
                             badgeId: self.clan.badgeId)
        playerProfile.arena = .init(id: self.arena.id,
                              name: self.arena.name)
        playerProfile.leagueStatistics.currentSeason =
            .init(id: self.leagueStatistics.currentSeason.id,
                  trophies: self.leagueStatistics.currentSeason.trophies,
                  bestTrophies: self.leagueStatistics.currentSeason.bestTrophies,
                  rank: self.leagueStatistics.currentSeason.rank)
        playerProfile.leagueStatistics.previousSeason =
            .init(id: self.leagueStatistics.previousSeason.id,
                  trophies: self.leagueStatistics.previousSeason.trophies,
                  bestTrophies: self.leagueStatistics.previousSeason.bestTrophies,
                  rank: self.leagueStatistics.previousSeason.rank)
        playerProfile.leagueStatistics.bestSeason =
            .init(id: self.leagueStatistics.bestSeason.id,
                  trophies: self.leagueStatistics.bestSeason.trophies,
                  bestTrophies: self.leagueStatistics.bestSeason.bestTrophies,
                  rank: self.leagueStatistics.bestSeason.rank)
        playerProfile.badges = self.badges.map { .init(name: $0.name,
                                                  progress: $0.progress) }
        playerProfile.achievements = self.achievements
            .map { .init(name: $0.name,
                         stars: $0.stars,
                         value: $0.value,
                         target: $0.target,
                         info: $0.info,
                         completionInfo: $0.completionInfo) }
        playerProfile.cards = self.cards.map {
            OAPI.Models.PlayerProfile.Card
                .init(name: $0.name,
                      id: $0.id,
                      level: $0.level,
                      maxLevel: $0.maxLevel,
                      count: $0.count,
                      iconUrls:  .init(
                        medium: $0.iconUrls.medium))
        }
        playerProfile.currentDeck = self.currentDeck.map {
            OAPI.Models.PlayerProfile.Card
                .init(name: $0.name,
                      id: $0.id,
                      level: $0.level,
                      maxLevel: $0.maxLevel,
                      count: $0.count,
                      iconUrls: .init(
                        medium: $0.iconUrls.medium))
        }
        playerProfile.currentFavouriteCard = OAPI.Models.PlayerProfile.Card
            .init(name: self.currentFavouriteCard.name,
                  id: self.currentFavouriteCard.id,
                  level: self.currentFavouriteCard.level,
                  maxLevel: self.currentFavouriteCard.maxLevel,
                  count: self.currentFavouriteCard.count,
                  iconUrls: .init(
                    medium: self.currentFavouriteCard.iconUrls.medium))
        
        datas.playerProfile.wrappedValue = playerProfile
    }
}
