//
//  ClanProfile.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation

private typealias ClanProfile = OAPI.Models.ClanProfile

extension OAPI.Models {
    struct ClanProfile {
        var tag: String = .init()
        var name: String = .init()
        var type: String = .init()
        var description: String = .init()
        var badgeId: Int = .init()
        var clanScore: Int = .init()
        var clanWarTrophies: Int = .init()
        var location: Location = .init()
        var requiredTrophies: Int = .init()
        var donationsPerWeek: Int = .init()
        var clanChestStatus: String = .init()
        var clanChestLevel: Int = .init()
        var clanChestMaxLevel: Int = .init()
        var members: Int = .init()
        var memberList: [Member] = .init()
    }
}

extension ClanProfile {
    struct Location {
        var id: Int = .init()
        var name: String = .init()
        var isCountry: Bool = .init()
        var countryCode: String = .init()
    }
}

extension ClanProfile {
    struct Arena {
        var id: Int = .init()
        var name: String = .init()
    }
}

extension ClanProfile {
    struct Member {
        var tag: String = .init()
        var name: String = .init()
        var role: String = .init()
        var lastSeen: String = .init()
        var expLevel: String = .init()
        var trophies: String = .init()
        var arena: Arena = .init()
        var clanRank: String = .init()
        var previousClanRank: String = .init()
        var donations: String = .init()
        var donationsReceived: String = .init()
        var clanChestPoints: String = .init()
    }
}
