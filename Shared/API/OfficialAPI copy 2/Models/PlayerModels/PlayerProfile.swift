//
//  PlayerProfile.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation

private typealias PlayerProfile = OAPI.Models.PlayerProfile

extension OAPI.Models {
    struct PlayerProfile {
        
        var tag: String = .init()
        var name: String = .init()
        var expLevel: Int = .init()
        var trophies: Int = .init()
        var bestTrophies: Int = .init()
        var wins: Int = .init()
        var losses: Int = .init()
        var battleCount: Int = .init()
        var threeCrownWins: Int = .init()
        var challengeCardsWon: Int = .init()
        var challengeMaxWins: Int = .init()
        var tournamentCardsWon: Int = .init()
        var tournamentBattleCount: Int = .init()
        var role: String = .init()
        var donations: Int = .init()
        var donationsReceived: Int = .init()
        var totalDonations: Int = .init()
        var warDayWins: Int = .init()
        var clanCardsCollected: Int = .init()
        var clan: Clan = .init()
        var arena: Arena = .init()
        var leagueStatistics: LeagueStatistics = .init()
        var badges: [Badge] = .init()
        var achievements: [Achievement] = .init()
        var cards: [Card] = .init()
        var currentDeck: [Card] = .init()
        var currentFavouriteCard: Card = .init()
        
    }
}

extension PlayerProfile {
    struct Card {
        var name: String = .init()
        var id: Int = .init()
        var level: Int = .init()
        var maxLevel: Int = .init()
        var count: Int = .init()
        var iconUrls: IconUrls = .init()
    }
}

extension PlayerProfile {
    struct Achievement {
        var name: String = .init()
        var stars: Int = .init()
        var value: Int = .init()
        var target: Int = .init()
        var info: String = .init()
        var completionInfo: String = .init()
    }
}

extension PlayerProfile {
    struct IconUrls {
        var medium: String = .init()
    }
}

extension PlayerProfile {
    struct Badge {
        var name: String = .init()
        var progress: Int = .init()
    }
}

extension PlayerProfile {
    struct Clan {
        var tag: String = .init()
        var name: String = .init()
        var badgeId: Int = .init()
    }
}

extension PlayerProfile {
    struct Arena {
        var id: Int = .init()
        var name: String = .init()
    }
}

extension PlayerProfile {
    struct LeagueStatistics {
        var currentSeason: SeasonStats = .init()
        var previousSeason: SeasonStats = .init()
        var bestSeason: SeasonStats = .init()
    }
}

extension PlayerProfile {
    struct SeasonStats {
        var id: String = .init()
        var trophies: Int = .init()
        var bestTrophies: Int = .init()
        var rank: Int = .init()
    }
}
