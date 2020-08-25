//
//  ClanProfile.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation
import SwiftUI

private typealias ClanProfile = OAPI.CodableModels.ClanProfile

extension OAPI.CodableModels {
    struct ClanProfile: Codable, EmptyInitializable {
        @DecodeNilable var tag: String = .init()
        @DecodeNilable var name: String = .init()
        @DecodeNilable var type: String = .init()
        @DecodeNilable var description: String = .init()
        @DecodeNilable var badgeId: Int = .init()
        @DecodeNilable var clanScore: Int = .init()
        @DecodeNilable var clanWarTrophies: Int = .init()
        @DecodeNilable var location: Location = .init()
        @DecodeNilable var requiredTrophies: Int = .init()
        @DecodeNilable var donationsPerWeek: Int = .init()
        @DecodeNilable var clanChestStatus: String = .init()
        @DecodeNilable var clanChestLevel: Int = .init()
        @DecodeNilable var clanChestMaxLevel: Int = .init()
        @DecodeNilable var members: Int = .init()
        @DecodeNilable var memberList: [Member] = .init()
    }
}

extension ClanProfile {
    struct Location: Codable, EmptyInitializable {
        @DecodeNilable var id: Int = .init()
        @DecodeNilable var name: String = .init()
        @DecodeNilable var isCountry: Bool = .init()
        @DecodeNilable var countryCode: String = .init()
    }
}

extension ClanProfile {
    struct Arena: Codable, EmptyInitializable {
        @DecodeNilable var id: Int = .init()
        @DecodeNilable var name: String = .init()
    }
}

extension ClanProfile {
    struct Member: Codable, EmptyInitializable {
        @DecodeNilable var tag: String = .init()
        @DecodeNilable var name: String = .init()
        @DecodeNilable var role: String = .init()
        @DecodeNilable var lastSeen: String = .init()
        @DecodeNilable var expLevel: Int = .init()
        @DecodeNilable var trophies: Int = .init()
        @DecodeNilable var arena: Arena = .init()
        @DecodeNilable var clanRank: Int = .init()
        @DecodeNilable var previousClanRank: Int = .init()
        @DecodeNilable var donations: Int = .init()
        @DecodeNilable var donationsReceived: Int = .init()
        @DecodeNilable var clanChestPoints: Int = .init()
    }
}

extension ClanProfile: DecodeConvertible {
    func convertAndSave(datas: DatasEnvObj) {
        
        datas.clanProfile.wrappedValue =
            OAPI.Models.ClanProfile
            .init(tag: self.tag,
                        name: self.name,
                        type: self.type,
                        description: self.description,
                        badgeId: self.badgeId,
                        clanScore: self.clanScore,
                        clanWarTrophies: self.clanWarTrophies,
                        location: OfficialAPI.Models.ClanProfile.Location
                            .init(id: self.location.id,
                                  name: self.location.name,
                                  isCountry: self.location.isCountry,
                                  countryCode: self.location.countryCode),
                        requiredTrophies: self.requiredTrophies,
                        donationsPerWeek: self.donationsPerWeek,
                        clanChestStatus: self.clanChestStatus,
                        clanChestLevel: self.clanChestLevel,
                        clanChestMaxLevel: self.clanChestMaxLevel,
                        members: self.members,
                        memberList: self.memberList.map { member in
                            OAPI.Models.ClanProfile.Member
                                .init(tag: member.tag,
                                      name: member.name,
                                      role: member.role,
                                      lastSeen: member.lastSeen,
                                      expLevel: member.expLevel,
                                      trophies: member.trophies,
                                      arena: .init(id: member.arena.id,
                                                   name: member.arena.name),
                                      clanRank: member.clanRank,
                                      previousClanRank: member.previousClanRank,
                                      donations: member.donations,
                                      donationsReceived: member.donationsReceived,
                                      clanChestPoints: member.clanChestPoints)
                        })
        
    }
}
