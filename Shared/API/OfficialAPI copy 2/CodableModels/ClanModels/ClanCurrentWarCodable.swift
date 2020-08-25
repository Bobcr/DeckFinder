//
//  ClanCurrentWar.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation
import SwiftUI

private typealias ClanCurrentWar = OAPI.CodableModels.ClanCurrentWar

extension OAPI.CodableModels {
    struct ClanCurrentWar: Codable, EmptyInitializable {
        @DecodeNilable var state: String = .init()
        @DecodeNilable var warEndTime: String = .init()
        @DecodeNilable var collectionEndTime: String = .init()
        @DecodeNilable var clan: ClanInfo = .init()
        @DecodeNilable var participants: [Participant] = .init()
        @DecodeNilable var clans: [ParticipantClan] = .init()
    }
}

extension ClanCurrentWar {
    struct ClanInfo: Codable, EmptyInitializable {
        @DecodeNilable var tag: String = .init()
        @DecodeNilable var name: String = .init()
        @DecodeNilable var badgeId: Int = .init()
        @DecodeNilable var clanScore: Int = .init()
        @DecodeNilable var participants: Int = .init()
        @DecodeNilable var battlesPlayed: Int = .init()
        @DecodeNilable var wins: Int = .init()
        @DecodeNilable var crowns: Int = .init()
    }
}

extension ClanCurrentWar {
    struct Participant: Codable, EmptyInitializable {
        @DecodeNilable var tag: String = .init()
        @DecodeNilable var name: String = .init()
        @DecodeNilable var cardsEarned: Int = .init()
        @DecodeNilable var battlesPlayed: Int = .init()
        @DecodeNilable var wins: Int = .init()
        @DecodeNilable var collectionDayBattlesPlayed: Int = .init()
        @DecodeNilable var numberOfBattles: Int = .init()
    }
}

extension ClanCurrentWar {
    struct ParticipantClan: Codable, EmptyInitializable {
        @DecodeNilable var tag: String = .init()
        @DecodeNilable var name: String = .init()
        @DecodeNilable var badgeId: Int = .init()
        @DecodeNilable var clanScore: Int = .init()
        @DecodeNilable var participants: Int = .init()
        @DecodeNilable var battlesPlayed: Int = .init()
        @DecodeNilable var wins: Int = .init()
        @DecodeNilable var crowns: Int = .init()
    }
}

extension ClanCurrentWar: DecodeConvertible {
    func convertAndSave(datas: DatasEnvObj) {
        
        datas.clanCurrentWar.wrappedValue = OAPI.Models.ClanCurrentWar
            .init(state: self.state,
                  warEndTime: self.warEndTime,
                  collectionEndTime: self.collectionEndTime,
                  clan: OfficialAPI.Models.ClanCurrentWar.ClanInfo
                    .init(tag: self.clan.tag,
                          name: self.clan.name,
                          badgeId: self.clan.badgeId,
                          clanScore: self.clan.clanScore,
                          participants: self.clan.participants,
                          battlesPlayed: self.clan.battlesPlayed,
                          wins: self.clan.wins,
                          crowns: self.clan.crowns),
                  participants: self.participants.map { participant in
                    OAPI.Models.ClanCurrentWar.Participant
                        .init(tag: participant.tag,
                              name: participant.name,
                              cardsEarned: participant.cardsEarned,
                              battlesPlayed: participant.battlesPlayed,
                              wins: participant.wins,
                              collectionDayBattlesPlayed: participant.collectionDayBattlesPlayed,
                              numberOfBattles: participant.numberOfBattles)
                  },
                  clans: self.clans.map { clan in
                    OfficialAPI.Models.ClanCurrentWar.ParticipantClan
                        .init(tag: clan.tag,
                              name: clan.name,
                              badgeId: clan.badgeId,
                              clanScore: clan.clanScore,
                              participants: clan.participants,
                              battlesPlayed: clan.battlesPlayed,
                              wins: clan.wins,
                              crowns: clan.crowns)
                  })
        
    }
}
