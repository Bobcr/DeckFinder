import Foundation

private typealias ClanCurrentWar = OAPI.Models.ClanCurrentWar

extension OAPI.Models {
    struct ClanCurrentWar: Codable, EmptyInitializable {
        @DecodeNilable var state: String = .init()
//        @DecodeNilable var warEndTime: String = .init()
//        @DecodeNilable var collectionEndTime: String = .init()
        @DecodeNilable var clan: Clan = .init()
//        @DecodeNilable var participants: [Participant] = .init()
        @DecodeNilable var clans: [Clan] = .init()
    }
}

extension ClanCurrentWar {
    struct Clan: Codable, EmptyInitializable {
        @DecodeNilable var tag: String = .init()
        @DecodeNilable var name: String = .init()
        @DecodeNilable var badgeId: Int = .init()
        @DecodeNilable var badgeName: String = .init()
        @DecodeNilable var clanScore: Int = .init()
        @DecodeNilable var participants: [Participant] = .init()
//        @DecodeNilable var battlesPlayed: Int = .init()
//        @DecodeNilable var wins: Int = .init()
//        @DecodeNilable var crowns: Int = .init()
        @DecodeNilable var fame: Int = .init()
        @DecodeNilable var repairPoints: Int = .init()
        @DecodeNilable var finishTime: String = .init()
        
        func populate() -> Self {
            var model = self
            model.badgeName = Funcs.Clan.badgeName(badgeId: model.badgeId)
            return model
        }
    }
}

extension ClanCurrentWar {
    struct Participant: Codable, EmptyInitializable {
        @DecodeNilable var tag: String = .init()
        @DecodeNilable var name: String = .init()
        @DecodeNilable var fame: Int = .init()
        @DecodeNilable var repairPoints: Int = .init()
//        @DecodeNilable var cardsEarned: Int = .init()
//        @DecodeNilable var battlesPlayed: Int = .init()
//        @DecodeNilable var wins: Int = .init()
//        @DecodeNilable var collectionDayBattlesPlayed: Int = .init()
//        @DecodeNilable var numberOfBattles: Int = .init()
    }
}

//extension ClanCurrentWar {
//    struct ParticipantClan: Codable, EmptyInitializable {
//        @DecodeNilable var tag: String = .init()
//        @DecodeNilable var name: String = .init()
//        @DecodeNilable var badgeId: Int = .init()
//        @DecodeNilable var badgeName: String = .init()
//        @DecodeNilable var clanScore: Int = .init()
//        @DecodeNilable var participants: Int = .init()
//        @DecodeNilable var battlesPlayed: Int = .init()
//        @DecodeNilable var wins: Int = .init()
//        @DecodeNilable var crowns: Int = .init()
//
//        func populate() -> Self {
//            var model = self
//            model.badgeName = Funcs.Clan.badgeName(badgeId: model.badgeId)
//            return model
//        }
//    }
//}

extension ClanCurrentWar: DecodeConvertible {
    func actionsToBeTakenAfterCompletion(datas: DatasEnvObj, arg: String) {
        datas.clanCurrentWar.set(to: self.populate())
    }
}

extension ClanCurrentWar {
    func populate() -> OfficialAPI.Models.ClanCurrentWar {
        return .init(state: self.state,
//                     warEndTime: self.warEndTime,
//                     collectionEndTime: self.collectionEndTime,
                     clan: self.clan.populate(),
//                     participants: self.participants,
                     clans: self.clans.map{$0.populate()})
    }
}
