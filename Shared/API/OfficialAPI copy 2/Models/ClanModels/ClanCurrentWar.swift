//
//  ClanCurrentWar.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation

private typealias ClanCurrentWar = OAPI.Models.ClanCurrentWar

extension OAPI.Models {
    struct ClanCurrentWar {
        var state: String = .init()
        var warEndTime: String = .init()
        var collectionEndTime: String = .init()
        var clan: ClanInfo = .init()
        var participants: [Participant] = .init()
        var clans: [ParticipantClan] = .init()
    }
}

extension ClanCurrentWar {
    struct ClanInfo {
        var tag: String = .init()
        var name: String = .init()
        var badgeId: Int = .init()
        var clanScore: Int = .init()
        var participants: Int = .init()
        var battlesPlayed: Int = .init()
        var wins: Int = .init()
        var crowns: Int = .init()
    }
}

extension ClanCurrentWar {
    struct Participant {
        var tag: String = .init()
        var name: String = .init()
        var cardsEarned: Int = .init()
        var battlesPlayed: Int = .init()
        var wins: Int = .init()
        var collectionDayBattlesPlayed: Int = .init()
        var numberOfBattles: Int = .init()
    }
}

extension ClanCurrentWar {
    struct ParticipantClan {
        var tag: String = .init()
        var name: String = .init()
        var badgeId: Int = .init()
        var clanScore: Int = .init()
        var participants: Int = .init()
        var battlesPlayed: Int = .init()
        var wins: Int = .init()
        var crowns: Int = .init()
    }
}

