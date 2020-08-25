//
//  ClanWarLog.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation

private typealias ClanWarLog = OAPI.CodableModels.ClanWarLog

extension OAPI.CodableModels {
    struct ClanWarLog: Codable {
        var items: [Item]? = .init()
    }
}

extension ClanWarLog {
    struct Item: Codable {
        var seasonId: Int? = .init()
        var createdDate: String? = .init()
        var participants: [Participant]? = .init()
        var standings: [ParticipantClan]? = .init()
    }
}


extension ClanWarLog {
    struct Participant: Codable {
        var tag: String? = .init()
        var name: String? = .init()
        var cardsEarned: Int? = .init()
        var battlesPlayed: Int? = .init()
        var wins: Int? = .init()
        var collectionDayBattlesPlayed: Int? = .init()
        var numberOfBattles: Int? = .init()
    }
}

extension ClanWarLog {
    struct ParticipantClan: Codable {
        var clan: ClanInfo? = .init()
        var trophyChange: Int? = .init()
    }
}

extension ClanWarLog {
    struct ClanInfo: Codable {
        var tag: String? = .init()
        var name: String? = .init()
        var badgeId: Int? = .init()
        var clanScore: Int? = .init()
        var participants: Int? = .init()
        var battlesPlayed: Int? = .init()
        var wins: Int? = .init()
        var crowns: Int? = .init()
    }
}

extension ClanWarLog: DecodeConvertible {
    func convertAfterDecode() -> OAPI.Models.ClanWarLog {
        
        let returni = OAPI.Models.ClanWarLog
            .init(items: self.items?.map { item in
                OfficialAPI.Models.ClanWarLog.Item
                    .init(seasonId: item.seasonId ?? .init(),
                          createdDate: item.createdDate ?? .init(),
                          participants: item.participants?.map { participant in
                            OfficialAPI.Models.ClanWarLog.Participant
                                .init(tag: participant.tag ?? .init(),
                                      name: participant.name ?? .init(),
                                      cardsEarned: participant.cardsEarned ?? .init(),
                                      battlesPlayed: participant.battlesPlayed ?? .init(),
                                      wins: participant.wins ?? .init(),
                                      collectionDayBattlesPlayed: participant.collectionDayBattlesPlayed ?? .init(),
                                      numberOfBattles: participant.numberOfBattles ?? .init())
                          } ?? [],
                          standings: item.standings?.map { standing in
                            OAPI.Models.ClanWarLog.ParticipantClan
                                .init(clan: OfficialAPI.Models.ClanWarLog.ClanInfo
                                        .init(tag: standing.clan?.tag ?? .init(),
                                              name: standing.clan?.name ?? .init(),
                                              badgeId: standing.clan?.badgeId ?? .init(),
                                              clanScore: standing.clan?.clanScore ?? .init(),
                                              participants: standing.clan?.participants ?? .init(),
                                              battlesPlayed: standing.clan?.battlesPlayed ?? .init(),
                                              wins: standing.clan?.wins ?? .init(),
                                              crowns: standing.clan?.crowns ?? .init()),
                                      trophyChange: standing.trophyChange ?? .init())
                          } ?? [])
            } ?? [])
        
        return returni
    }
}
