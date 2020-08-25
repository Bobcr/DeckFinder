//
//  ClanCurrentWar.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation

private typealias ClanCurrentWar = OAPI.CodableModels.ClanCurrentWar

extension OAPI.CodableModels {
    struct ClanCurrentWar: Codable {
        var state: String? = .init()
        var warEndTime: String? = .init()
        var collectionEndTime: String? = .init()
        var clan: ClanInfo? = .init()
        var participants: [Participant]? = .init()
        var clans: [ParticipantClan]? = .init()
    }
}

extension ClanCurrentWar {
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

extension ClanCurrentWar {
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

extension ClanCurrentWar {
    struct ParticipantClan: Codable {
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

extension ClanCurrentWar: DecodeConvertible {
    func convertAfterDecode() -> OAPI.Models.ClanCurrentWar {
        
        let returni = OAPI.Models.ClanCurrentWar
            .init(state: self.state ?? .init(),
                  warEndTime: self.warEndTime ?? .init(),
                  collectionEndTime: self.collectionEndTime ?? .init(),
                  clan: OfficialAPI.Models.ClanCurrentWar.ClanInfo
                    .init(tag: self.clan?.tag ?? .init(),
                          name: self.clan?.name ?? .init(),
                          badgeId: self.clan?.badgeId ?? .init(),
                          clanScore: self.clan?.clanScore ?? .init(),
                          participants: self.clan?.participants ?? .init(),
                          battlesPlayed: self.clan?.battlesPlayed ?? .init(),
                          wins: self.clan?.wins ?? .init(),
                          crowns: self.clan?.crowns ?? .init()),
                  participants: self.participants?.map { participant in
                    OAPI.Models.ClanCurrentWar.Participant
                        .init(tag: participant.tag ?? .init(),
                              name: participant.name ?? .init(),
                              cardsEarned: participant.cardsEarned ?? .init(),
                              battlesPlayed: participant.battlesPlayed ?? .init(),
                              wins: participant.wins ?? .init(),
                              collectionDayBattlesPlayed: participant.collectionDayBattlesPlayed ?? .init(),
                              numberOfBattles: participant.numberOfBattles ?? .init())
                  } ?? [],
                  clans: self.clans?.map { clan in
                    OfficialAPI.Models.ClanCurrentWar.ParticipantClan
                        .init(tag: clan.tag ?? .init(),
                              name: clan.name ?? .init(),
                              badgeId: clan.badgeId ?? .init(),
                              clanScore: clan.clanScore ?? .init(),
                              participants: clan.participants ?? .init(),
                              battlesPlayed: clan.battlesPlayed ?? .init(),
                              wins: clan.wins ?? .init(),
                              crowns: clan.crowns ?? .init())
                  } ?? [])
        
        return returni
    }
}
