//
//  RequestModels.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation

extension OAPI.Requester {
    struct PlayerProfile { let tag: String }
    struct PlayerBattles { let tag: String }
    struct PlayerChests { let tag: String }
    struct ClanProfile { let tag: String }
    struct ClanCurrentWar { let tag: String }
    struct ClanWarLog { let tag: String }
    struct ClanNameSearch {
        let name: String = ""
        let locationId: Int? = nil
        let minMembers: Int? = nil
        let maxMembers: Int? = nil
        let minScore: Int? = nil
        let limit: Int? = nil
    }
    struct PlayerLeaderboard { let locationId: Int }
    struct ClanLeaderboard {
        enum SearchMode { case clans, warClans }
        let locationId: Int
        let `for`: SearchMode
    }
    typealias GTInfo = GlobalTourneyInfo
    typealias GTLeaderboard = GlobalTourneyLeaderboard
    struct GlobalTourneyInfo { }
    struct GlobalTourneyLeaderboard { var tag: String }
}

private typealias Requester = OAPI.Requester
//private typealias Models = OAPI.CodableModels

extension Requester.PlayerProfile: WebRequestable {
    typealias TypeToDecodeTo = OAPI.CodableModels.PlayerProfile
    
    func urlString() -> String {
        return OAPI.baseUrl + "players/\(tag.asTag().unsafeUrlHostEncode())"
    }
}

extension Requester.PlayerBattles: WebRequestable {
    typealias TypeToDecodeTo = OAPI.CodableModels.PlayerBattles
    
    func urlString() -> String {
        return OAPI.baseUrl + "players/\(tag.asTag().unsafeUrlHostEncode())/battlelog"
    }
}

extension Requester.PlayerChests: WebRequestable {
    typealias TypeToDecodeTo = OAPI.CodableModels.PlayerProfile
    
    func urlString() -> String {
        return OAPI.baseUrl + "players/\(tag.asTag().unsafeUrlHostEncode())/upcomingchests"
    }
}

extension Requester.ClanProfile: WebRequestable {
    typealias TypeToDecodeTo = OAPI.CodableModels.ClanProfile
    
    func urlString() -> String {
        return OAPI.baseUrl + "clans/\(tag.asTag().unsafeUrlHostEncode())"
    }
}

extension Requester.ClanCurrentWar: WebRequestable {
    typealias TypeToDecodeTo = OAPI.CodableModels.ClanCurrentWar

    func urlString() -> String {
        return OAPI.baseUrl + "clans/\(tag.asTag().unsafeUrlHostEncode())/currentwar"
    }
}

extension Requester.ClanWarLog: WebRequestable {
    typealias TypeToDecodeTo = OAPI.CodableModels.ClanWarLog

    func urlString() -> String {
        return OAPI.baseUrl + "clans/\(tag.asTag().unsafeUrlHostEncode())/warlog"
    }
}

extension Requester.ClanNameSearch: WebRequestable {
    typealias TypeToDecodeTo = OAPI.CodableModels.ClanNameSearch

    func urlString() -> String {
        
        let name = "name=\(self.name.urlHostEncode() ?? self.name)"
        
        let locationId = self.locationId == nil ? "" : "&locationId=\(self.locationId!)"
        let minMembers = self.minMembers == nil ? "" : "&minMembers=\(self.minMembers!)"
        let maxMembers = self.maxMembers == nil ? "" : "&maxMembers=\(self.maxMembers!)"
        let minScore = self.minScore == nil ? "" : "&minScore=\(self.minScore!)"
        let limit = self.limit == nil ? "" : "&limit=\(self.limit!)"
        
        return OAPI.baseUrl + "clans?\(name)\(locationId)\(minMembers)\(maxMembers)\(minScore)\(limit)"
    }
}

extension Requester.PlayerLeaderboard: WebRequestable {
    typealias TypeToDecodeTo = OAPI.CodableModels.PlayerLeaderboard

    func urlString() -> String {
        let location = locationId == 0 ? "global" : "\(locationId)"
        return OAPI.baseUrl + "locations/\(location)/rankings/players"
    }
}

extension Requester.ClanLeaderboard: WebRequestable {
    typealias TypeToDecodeTo = OAPI.CodableModels.ClanLeaderboard

    func urlString() -> String {
        let location = locationId == 0 ? "global" : "\(locationId)"
        let `for` = self.for == .clans ? "clans" : "warclans"
        return OAPI.baseUrl + "locations/\(location)/rankings/\(`for`)"
    }
}

extension Requester.GlobalTourneyInfo: WebRequestable {
    typealias TypeToDecodeTo = OAPI.CodableModels.GlobalTourneyInfo

    func urlString() -> String {
        return OAPI.baseUrl + "globaltournaments"
    }
}

extension Requester.GlobalTourneyLeaderboard: WebRequestable {
    typealias TypeToDecodeTo = OAPI.CodableModels.GlobalTourneyLeaderboard

    func urlString() -> String {
        return OAPI.baseUrl + "locations/global/rankings/tournaments/\(tag.asTag().unsafeUrlHostEncode())"
    }
}
