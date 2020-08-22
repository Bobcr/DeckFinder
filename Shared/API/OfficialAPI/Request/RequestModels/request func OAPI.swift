import Foundation
import SwiftUI

extension Requests.GTInfo {
    func request(showsAlerts: Bool = true,
                 managesProgressView: Bool = true,
                 completion: @escaping (OAPI.Status) -> Void) {
        
        OAPI.Requester.init(self, showsAlerts: showsAlerts, managesProgressView: managesProgressView)
            .request(completion: completion)
    }
}

extension Requests.GTLeaderboard {
    func request(showsAlerts: Bool = true,
                 managesProgressView: Bool = true,
                 completion: @escaping (OAPI.Status) -> Void) {
        
        OAPI.Requester.init(self, showsAlerts: showsAlerts, managesProgressView: managesProgressView)
            .request(completion: completion)
    }
}

extension Requests.PlayerProfile {
    func request(showsAlerts: Bool = true,
                 managesProgressView: Bool = true,
                 completion: @escaping (OAPI.Status) -> Void) {
        
        OAPI.Requester.init(self, showsAlerts: showsAlerts, managesProgressView: managesProgressView)
            .request(completion: completion)
    }
}

extension Requests.PlayerBattles {
    func request(showsAlerts: Bool = true,
                 managesProgressView: Bool = true,
                 completion: @escaping (OAPI.Status) -> Void) {
        
        OAPI.Requester.init(self, showsAlerts: showsAlerts, managesProgressView: managesProgressView)
            .request(completion: completion)
    }
}

extension Requests.PlayerChests {
    func request(showsAlerts: Bool = true,
                 managesProgressView: Bool = true,
                 completion: @escaping (OAPI.Status) -> Void) {
        
        OAPI.Requester.init(self, showsAlerts: showsAlerts, managesProgressView: managesProgressView)
            .request(completion: completion)
    }
}

extension Requests.ClanProfile {
    func request(showsAlerts: Bool = true,
                 managesProgressView: Bool = true,
                 completion: @escaping (OAPI.Status) -> Void) {
        
        OAPI.Requester.init(self, showsAlerts: showsAlerts, managesProgressView: managesProgressView)
            .request(completion: completion)
    }
}

extension Requests.ClanCurrentWar {
    func request(showsAlerts: Bool = true,
                 managesProgressView: Bool = true,
                 completion: @escaping (OAPI.Status) -> Void) {
        
        OAPI.Requester.init(self, showsAlerts: showsAlerts, managesProgressView: managesProgressView)
            .request(completion: completion)
    }
}

extension Requests.ClanWarLog {
    func request(showsAlerts: Bool = true,
                 managesProgressView: Bool = true,
                 completion: @escaping (OAPI.Status) -> Void) {
        
        OAPI.Requester.init(self, showsAlerts: showsAlerts, managesProgressView: managesProgressView)
            .request(completion: completion)
    }
}

extension Requests.ClanNameSearch {
    func request(showsAlerts: Bool = true,
                 managesProgressView: Bool = true,
                 completion: @escaping (OAPI.Status) -> Void) {
        
        OAPI.Requester.init(self, showsAlerts: showsAlerts, managesProgressView: managesProgressView)
            .request(completion: completion)
    }
}

extension Requests.PlayerLeaderboard {
    func request(showsAlerts: Bool = true,
                 managesProgressView: Bool = true,
                 completion: @escaping (OAPI.Status) -> Void) {
        
        OAPI.Requester.init(self, showsAlerts: showsAlerts, managesProgressView: managesProgressView)
            .request(completion: completion)
    }
}

extension Requests.ClanLeaderboard {
    func request(showsAlerts: Bool = true,
                 managesProgressView: Bool = true,
                 completion: @escaping (OAPI.Status) -> Void) {
        
        OAPI.Requester.init(self, showsAlerts: showsAlerts, managesProgressView: managesProgressView)
            .request(completion: completion)
    }
}
