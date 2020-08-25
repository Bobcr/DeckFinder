//
//  ClanWarLog.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation

private typealias ClanWarLog = OAPI.Models.ClanWarLog

extension OAPI.Models {
    struct ClanWarLog {
        var items: [Item] = .init()
    }
}

extension ClanWarLog {
    struct Item {
        var seasonId: Int = .init()
        var createdDate: String = .init()
        var participants: [Participant] = .init()
        var standings: [ParticipantClan] = .init()
    }
}


extension ClanWarLog {
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

extension ClanWarLog {
    struct ParticipantClan {
        var clan: ClanInfo = .init()
        var trophyChange: Int = .init()
    }
}

extension ClanWarLog {
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

