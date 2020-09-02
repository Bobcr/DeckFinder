import Foundation
import SwiftUI


extension Requests.PlayerProfile: WebGettable {
    typealias TypeToDecodeTo = OAPI.Models.PlayerProfile
    
    func urlString() -> String? {
        if tag.asTag().isValidTag() {
        return OAPI.baseUrl + "players/\(tag.asTag().unsafeUrlHostEncode())"
        }
        else {
            return nil
        }
    }
}

extension Requests.PlayerBattles: WebGettable {
    typealias TypeToDecodeTo = Array<OAPI.Models.PlayerBattle>
    
    func urlString() -> String? {
        if tag.asTag().isValidTag() {
        return OAPI.baseUrl + "players/\(tag.asTag().unsafeUrlHostEncode())/battlelog"
        }
        else {
            return nil
        }
    }
}

extension Requests.PlayerChests: WebGettable {
    typealias TypeToDecodeTo = OAPI.Models.PlayerChests
    
    func urlString() -> String? {
        if tag.asTag().isValidTag() {
            return OAPI.baseUrl + "players/\(tag.asTag().unsafeUrlHostEncode())/upcomingchests"
        }
        else {
            return nil
        }
    }
}

extension Requests.ClanProfile: WebGettable {
    typealias TypeToDecodeTo = OAPI.Models.ClanProfile
    
    func urlString() -> String? {
        if tag.asTag().isValidTag() {
        return OAPI.baseUrl + "clans/\(tag.asTag().unsafeUrlHostEncode())"
        }
        else {
            return nil
        }
    }
}

extension Requests.ClanCurrentWar: WebGettable {
    typealias TypeToDecodeTo = OAPI.Models.ClanCurrentWar

    func urlString() -> String? {
        if tag.asTag().isValidTag() {
        return OAPI.baseUrl + "clans/\(tag.asTag().unsafeUrlHostEncode())/currentriverrace"
        }
        else {
            return nil
        }
    }
}

extension Requests.ClanWarLog: WebGettable {
    typealias TypeToDecodeTo = OAPI.Models.ClanWarLog

    func urlString() -> String? {
        if tag.asTag().isValidTag() {
        return OAPI.baseUrl + "clans/\(tag.asTag().unsafeUrlHostEncode())/riverracelog"
        }
        else {
            return nil
        }
    }
}

extension Requests.ClanNameSearch: WebGettable {
    typealias TypeToDecodeTo = OAPI.Models.ClanNameSearch

    func urlString() -> String? {
        guard areValidInputs() else {
            return nil
        }
        
        let name = "name=\(self.name.urlHostEncode() ?? self.name)"
        let locationId = (self.locationId == nil || self.locationId == 00000000) ? "" :
            "&locationId=\(self.locationId!)"
        let minMembers = self.minMembers == nil ? "" : "&minMembers=\(self.minMembers!)"
        let maxMembers = self.maxMembers == nil ? "" : "&maxMembers=\(self.maxMembers!)"
        let minScore = self.minScore == nil ? "" : "&minScore=\(self.minScore!)"
        let limit = self.limit == nil ? "" : "&limit=\(self.limit!)"
        
        return OAPI.baseUrl + "clans?\(name)\(locationId)\(minMembers)\(maxMembers)\(minScore)\(limit)"
    }
}

extension Requests.ClanNameSearch {
    func areValidInputs() -> Bool {
        let condition1 = (minMembers ?? 3) > 2
        let condition2 = (maxMembers ?? 50) >= (minMembers ?? 3)
        let condition3 = (maxMembers ?? 50) <= 50
        let condition4 = (limit ?? 1) > 0
        let condition5 = (minScore ?? 1) > 0
        let condition6 = name.count > 2
        
        return assertEqual(condition1, condition2, condition3,
                           condition4, condition5, condition6,
                           with: true)
    }
}

extension Requests.PlayerLeaderboard: WebGettable {
    typealias TypeToDecodeTo = OAPI.Models.PlayerLeaderboard

    func urlString() -> String? {
        let location = region == .All ? "global" : region.value.id.description
        return OAPI.baseUrl + "locations/\(location)/rankings/players"
    }
}

extension Requests.ClanLeaderboard: WebGettable {
    typealias TypeToDecodeTo = OAPI.Models.ClanLeaderboard

    func urlString() -> String? {
        let location = region == .All ? "global" : region.value.id.description
        let `for` = self.for == .clans ? "clans" : "clanwars"
        return OAPI.baseUrl + "locations/\(location)/rankings/\(`for`)"
    }
}

extension Requests.GlobalTourneyInfo: WebGettable {
    typealias TypeToDecodeTo = OAPI.Models.GlobalTourneyInfo

    func urlString() -> String? {
        return OAPI.baseUrl + "globaltournaments"
    }
}

extension Requests.GlobalTourneyLeaderboard: WebGettable {
    typealias TypeToDecodeTo = OAPI.Models.GlobalTourneyLeaderboard

    func urlString() -> String? {
        if tag.asTag().isValidTag() {
            return OAPI.baseUrl + "locations/global/rankings/tournaments/\(tag.asTag().unsafeUrlHostEncode())"
        }
        else {
            return nil
        }
    }
}

private extension String {
    func removeAllChars(in string: String) -> String {
        var new = self
        
        for char in (string.map{$0}) {
            new = new.replacingOccurrences(of: String(char), with: "")
        }
        
        return new
    }
}

private extension String {
    func isValidTag() -> Bool {
        let new = self.removeAllChars(in: "0289CGJLPQRUVY# ")
        
        if new.isEmpty && (self.count >= 4) {
            return true
        }
        else {
            return false
        }
    }
}
