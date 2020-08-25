//
//  PlayerProfile.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation


private typealias PlayerProfile = OAPI.CodableModels.PlayerProfile

extension OAPI.CodableModels {
    struct PlayerProfile: Codable {
        
        var tag: String? = .init()
        var name: String? = .init()
        var expLevel: Int? = .init()
        var trophies: Int? = .init()
        var bestTrophies: Int? = .init()
        var wins: Int? = .init()
        var losses: Int? = .init()
        var battleCount: Int? = .init()
        var threeCrownWins: Int? = .init()
        var challengeCardsWon: Int? = .init()
        var challengeMaxWins: Int? = .init()
        var tournamentCardsWon: Int? = .init()
        var tournamentBattleCount: Int? = .init()
        var role: String? = .init()
        var donations: Int? = .init()
        var donationsReceived: Int? = .init()
        var totalDonations: Int? = .init()
        var warDayWins: Int? = .init()
        var clanCardsCollected: Int? = .init()
        var clan: Clan? = .init()
        var arena: Arena? = .init()
        var leagueStatistics: LeagueStatistics? = .init()
        var badges: [Badge]? = .init()
        var achievements: [Achievement]? = .init()
        var cards: [Card]? = .init()
        var currentDeck: [Card]? = .init()
        var currentFavouriteCard: Card? = .init()
        
    }
}

extension PlayerProfile {
    struct Card: Codable {
        var name: String? = .init()
        var id: Int? = .init()
        var level: Int? = .init()
        var maxLevel: Int? = .init()
        var count: Int? = .init()
        var iconUrls: IconUrls? = .init()
    }
}

extension PlayerProfile {
    struct Achievement: Codable {
        var name: String? = .init()
        var stars: Int? = .init()
        var value: Int? = .init()
        var target: Int? = .init()
        var info: String? = .init()
        var completionInfo: String? = .init()
    }
}

extension PlayerProfile {
    struct IconUrls: Codable {
        var medium: String? = .init()
    }
}

extension PlayerProfile {
    struct Badge: Codable {
        var name: String? = .init()
        var progress: Int? = .init()
    }
}

extension PlayerProfile {
    struct Clan: Codable {
        var tag: String? = .init()
        var name: String? = .init()
        var badgeId: Int? = .init()
    }
}

extension PlayerProfile {
    struct Arena: Codable {
        var id: Int? = .init()
        var name: String? = .init()
    }
}

extension PlayerProfile {
    struct LeagueStatistics: Codable {
        var currentSeason: SeasonStats? = .init()
        var previousSeason: SeasonStats? = .init()
        var bestSeason: SeasonStats? = .init()
    }
}

extension PlayerProfile.LeagueStatistics {
    struct SeasonStats: Codable {
        var id: Int? = .init()
        var trophies: Int? = .init()
        var bestTrophies: Int? = .init()
        var rank: Int? = .init()
    }
}

extension PlayerProfile: DecodeConvertible {
    func convertAfterDecode() -> OAPI.Models.PlayerProfile {
        var returni = OAPI.Models.PlayerProfile()
        
        returni.tag = self.tag ?? .init()
        returni.name = self.name ?? .init()
        returni.expLevel = self.expLevel ?? .init()
        returni.trophies = self.trophies ?? .init()
        returni.bestTrophies = self.bestTrophies ?? .init()
        returni.wins = self.wins ?? .init()
        returni.losses = self.losses ?? .init()
        returni.battleCount = self.battleCount ?? .init()
        returni.threeCrownWins = self.threeCrownWins ?? .init()
        returni.challengeCardsWon = self.challengeCardsWon ?? .init()
        returni.challengeMaxWins = self.challengeMaxWins ?? .init()
        returni.tournamentCardsWon = self.tournamentCardsWon ?? .init()
        returni.tournamentBattleCount = self.tournamentBattleCount ?? .init()
        returni.role = self.role ?? .init()
        returni.donations = self.donations ?? .init()
        returni.donationsReceived = self.donationsReceived ?? .init()
        returni.totalDonations = self.totalDonations ?? .init()
        returni.warDayWins = self.warDayWins ?? .init()
        returni.clanCardsCollected = self.clanCardsCollected ?? .init()
        returni.clan = .init(tag: self.clan?.tag ?? .init(),
                             name: self.clan?.name ?? .init(),
                             badgeId: self.clan?.badgeId ?? .init())
        returni.arena = .init(id: self.arena?.id ?? .init(),
                              name: self.arena?.name ?? .init())
        returni.leagueStatistics.currentSeason =
            .init(id: self.leagueStatistics?.currentSeason?.id ?? .init(),
                  trophies: self.leagueStatistics?.currentSeason?.trophies ?? .init(),
                  bestTrophies: self.leagueStatistics?.currentSeason?.bestTrophies ?? .init(),
                  rank: self.leagueStatistics?.currentSeason?.rank ?? .init())
        returni.leagueStatistics.previousSeason =
            .init(id: self.leagueStatistics?.previousSeason?.id ?? .init(),
                  trophies: self.leagueStatistics?.previousSeason?.trophies ?? .init(),
                  bestTrophies: self.leagueStatistics?.previousSeason?.bestTrophies ?? .init(),
                  rank: self.leagueStatistics?.previousSeason?.rank ?? .init())
        returni.leagueStatistics.bestSeason =
            .init(id: self.leagueStatistics?.bestSeason?.id ?? .init(),
                  trophies: self.leagueStatistics?.bestSeason?.trophies ?? .init(),
                  bestTrophies: self.leagueStatistics?.bestSeason?.bestTrophies ?? .init(),
                  rank: self.leagueStatistics?.bestSeason?.rank ?? .init())
        returni.badges = self.badges?.map { .init(name: $0.name ?? .init(),
                                                  progress: $0.progress ?? .init()) } ?? []
        returni.achievements = self.achievements?
            .map { .init(name: $0.name ?? .init(),
                         stars: $0.stars ?? .init(),
                         value: $0.value ?? .init(),
                         target: $0.target ?? .init(),
                         info: $0.info ?? .init(),
                         completionInfo: $0.completionInfo ?? .init()) } ?? []
        returni.cards = self.cards?.map {
            OAPI.Models.PlayerProfile.Card
                .init(name: $0.name ?? .init(),
                      id: $0.id ?? .init(),
                      level: $0.level ?? .init(),
                      maxLevel: $0.maxLevel ?? .init(),
                      count: $0.count ?? .init(),
                      iconUrls:  .init(
                        medium: $0.iconUrls?.medium ?? .init()))
        } ?? []
        returni.currentDeck = self.currentDeck?.map {
            OAPI.Models.PlayerProfile.Card
                .init(name: $0.name ?? .init(),
                      id: $0.id ?? .init(),
                      level: $0.level ?? .init(),
                      maxLevel: $0.maxLevel ?? .init(),
                      count: $0.count ?? .init(),
                      iconUrls: .init(
                        medium: $0.iconUrls?.medium ?? .init()))
        } ?? []
        returni.currentFavouriteCard = OAPI.Models.PlayerProfile.Card
            .init(name: self.currentFavouriteCard?.name ?? .init(),
                  id: self.currentFavouriteCard?.id ?? .init(),
                  level: self.currentFavouriteCard?.level ?? .init(),
                  maxLevel: self.currentFavouriteCard?.maxLevel ?? .init(),
                  count: self.currentFavouriteCard?.count ?? .init(),
                  iconUrls: .init(
                    medium: self.currentFavouriteCard?.iconUrls?.medium ?? .init()))
        
        return returni
    }
}
