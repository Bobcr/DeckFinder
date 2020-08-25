//
//  ClanWarLog.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation
import SwiftUI

private typealias ClanWarLog = OAPI.CodableModels.ClanWarLog

extension OAPI.CodableModels {
    struct ClanWarLog: Codable, EmptyInitializable {
        @DecodeNilable var items: [Item] = .init()
    }
}

extension ClanWarLog {
    struct Item: Codable, EmptyInitializable {
        @DecodeNilable var seasonId: Int = .init()
        @DecodeNilable var createdDate: String = .init()
        @DecodeNilable var participants: [Participant] = .init()
        @DecodeNilable var standings: [ParticipantClan] = .init()
    }
}


extension ClanWarLog {
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

extension ClanWarLog {
    struct ParticipantClan: Codable, EmptyInitializable {
        @DecodeNilable var clan: ClanInfo = .init()
        @DecodeNilable var trophyChange: Int = .init()
    }
}

extension ClanWarLog {
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

extension ClanWarLog: DecodeConvertible {
    func convertAndSave(datas: DatasEnvObj) {
        
        datas.clanWarLog.wrappedValue = OAPI.Models.ClanWarLog
            .init(items: self.items.map { item in
                OfficialAPI.Models.ClanWarLog.Item
                    .init(seasonId: item.seasonId,
                          createdDate: item.createdDate,
                          participants: item.participants.map { participant in
                            OfficialAPI.Models.ClanWarLog.Participant
                                .init(tag: participant.tag,
                                      name: participant.name,
                                      cardsEarned: participant.cardsEarned,
                                      battlesPlayed: participant.battlesPlayed,
                                      wins: participant.wins,
                                      collectionDayBattlesPlayed: participant.collectionDayBattlesPlayed,
                                      numberOfBattles: participant.numberOfBattles)
                          },
                          standings: item.standings.map { standing in
                            OAPI.Models.ClanWarLog.ParticipantClan
                                .init(clan: OfficialAPI.Models.ClanWarLog.ClanInfo
                                        .init(tag: standing.clan.tag,
                                              name: standing.clan.name,
                                              badgeId: standing.clan.badgeId,
                                              clanScore: standing.clan.clanScore,
                                              participants: standing.clan.participants,
                                              battlesPlayed: standing.clan.battlesPlayed,
                                              wins: standing.clan.wins,
                                              crowns: standing.clan.crowns),
                                      trophyChange: standing.trophyChange)
                          })
            })
        
    }
}
