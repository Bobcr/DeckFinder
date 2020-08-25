//
//  ClanProfile.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation

private typealias ClanProfile = OAPI.CodableModels.ClanProfile

extension OAPI.CodableModels {
    struct ClanProfile: Codable {
        var tag: String? = .init()
        var name: String? = .init()
        var type: String? = .init()
        var description: String? = .init()
        var badgeId: Int? = .init()
        var clanScore: Int? = .init()
        var clanWarTrophies: Int? = .init()
        var location: Location? = .init()
        var requiredTrophies: Int? = .init()
        var donationsPerWeek: Int? = .init()
        var clanChestStatus: String? = .init()
        var clanChestLevel: Int? = .init()
        var clanChestMaxLevel: Int? = .init()
        var members: Int? = .init()
        var memberList: [Member]? = .init()
    }
}

extension ClanProfile {
    struct Location: Codable {
        var id: Int? = .init()
        var name: String? = .init()
        var isCountry: Bool? = .init()
        var countryCode: String? = .init()
    }
}

extension ClanProfile {
    struct Arena: Codable {
        var id: Int? = .init()
        var name: String? = .init()
    }
}

extension ClanProfile {
    struct Member: Codable {
        var tag: String? = .init()
        var name: String? = .init()
        var role: String? = .init()
        var lastSeen: String? = .init()
        var expLevel: String? = .init()
        var trophies: String? = .init()
        var arena: Arena? = .init()
        var clanRank: String? = .init()
        var previousClanRank: String? = .init()
        var donations: String? = .init()
        var donationsReceived: String? = .init()
        var clanChestPoints: String? = .init()
    }
}

extension ClanProfile: DecodeConvertible {
    func convertAfterDecode() -> OAPI.Models.ClanProfile {
        
        let returni =
            OAPI.Models.ClanProfile
            .init(tag: self.tag ?? .init(),
                        name: self.name ?? .init(),
                        type: self.type ?? .init(),
                        description: self.description ?? .init(),
                        badgeId: self.badgeId ?? .init(),
                        clanScore: self.clanScore ?? .init(),
                        clanWarTrophies: self.clanWarTrophies ?? .init(),
                        location: OfficialAPI.Models.ClanProfile.Location
                            .init(id: self.location?.id ?? .init(),
                                  name: self.location?.name ?? .init(),
                                  isCountry: self.location?.isCountry ?? .init(),
                                  countryCode: self.location?.countryCode ?? .init()),
                        requiredTrophies: self.requiredTrophies ?? .init(),
                        donationsPerWeek: self.donationsPerWeek ?? .init(),
                        clanChestStatus: self.clanChestStatus ?? .init(),
                        clanChestLevel: self.clanChestLevel ?? .init(),
                        clanChestMaxLevel: self.clanChestMaxLevel ?? .init(),
                        members: self.members ?? .init(),
                        memberList: self.memberList?.map { member in
                            OAPI.Models.ClanProfile.Member
                                .init(tag: member.tag ?? .init(),
                                      name: member.name ?? .init(),
                                      role: member.role ?? .init(),
                                      lastSeen: member.lastSeen ?? .init(),
                                      expLevel: member.expLevel ?? .init(),
                                      trophies: member.trophies ?? .init(),
                                      arena: .init(id: member.arena?.id ?? .init(),
                                                   name: member.arena?.name ?? .init()),
                                      clanRank: member.clanRank ?? .init(),
                                      previousClanRank: member.previousClanRank ?? .init(),
                                      donations: member.donations ?? .init(),
                                      donationsReceived: member.donationsReceived ?? .init(),
                                      clanChestPoints: member.clanChestPoints ?? .init())
                        } ?? [])
        
        return returni
    }
}
