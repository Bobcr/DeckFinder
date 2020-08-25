//
//  request func.swift
//  iOS
//
//  Created by Mohammad on 7/9/20.
//

import Foundation
import SwiftUI


typealias Models = OAPI.Requests

extension Models.GTInfo {
    func request(completion: @escaping (OAPI.Status) -> Void) {
        OAPI.Requester.init(self).request(completion: completion)
    }
}

extension Models.GTLeaderboard {
    func request(completion: @escaping (OAPI.Status) -> Void) {
        OAPI.Requester.init(self).request(completion: completion)
    }
}

extension Models.PlayerProfile {
    func request(completion: @escaping (OAPI.Status) -> Void) {
        OAPI.Requester.init(self).request(completion: completion)
    }
}

extension Models.PlayerBattles {
    func request(completion: @escaping (OAPI.Status) -> Void) {
        OAPI.Requester.init(self).request(completion: completion)
    }
}

extension Models.PlayerChests {
    func request(completion: @escaping (OAPI.Status) -> Void) {
        OAPI.Requester.init(self).request(completion: completion)
    }
}

extension Models.ClanProfile {
    func request(completion: @escaping (OAPI.Status) -> Void) {
        OAPI.Requester.init(self).request(completion: completion)
    }
}

extension Models.ClanCurrentWar {
    func request(completion: @escaping (OAPI.Status) -> Void) {
        OAPI.Requester.init(self).request(completion: completion)
    }
}

extension Models.ClanWarLog {
    func request(completion: @escaping (OAPI.Status) -> Void) {
        OAPI.Requester.init(self).request(completion: completion)
    }
}

extension Models.ClanNameSearch {
    func request(completion: @escaping (OAPI.Status) -> Void) {
        OAPI.Requester.init(self).request(completion: completion)
    }
}

extension Models.PlayerLeaderboard {
    func request(completion: @escaping (OAPI.Status) -> Void) {
        OAPI.Requester.init(self).request(completion: completion)
    }
}

extension Models.ClanLeaderboard {
    func request(completion: @escaping (OAPI.Status) -> Void) {
        OAPI.Requester.init(self).request(completion: completion)
    }
}
