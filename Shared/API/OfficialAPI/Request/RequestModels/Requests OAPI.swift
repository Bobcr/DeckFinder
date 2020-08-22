import Foundation

extension Requests {
    typealias GTInfo = GlobalTourneyInfo
    typealias GTLeaderboard = GlobalTourneyLeaderboard
    
    struct PlayerProfile: EnvironmentFriendly {
        var datas: DatasEnvObj
        var appearance: AppearanceEnvObj
        let tag: String
    }
    struct PlayerBattles: EnvironmentFriendly {
        var datas: DatasEnvObj
        var appearance: AppearanceEnvObj
        let tag: String
    }
    struct PlayerChests: EnvironmentFriendly {
        var datas: DatasEnvObj
        var appearance: AppearanceEnvObj
        let tag: String
    }
    struct ClanProfile: EnvironmentFriendly {
        var datas: DatasEnvObj
        var appearance: AppearanceEnvObj
        let tag: String
    }
    struct ClanCurrentWar: EnvironmentFriendly {
        var datas: DatasEnvObj
        var appearance: AppearanceEnvObj
        let tag: String
    }
    struct ClanWarLog: EnvironmentFriendly {
        var datas: DatasEnvObj
        var appearance: AppearanceEnvObj
        let tag: String
    }
    struct ClanNameSearch: EnvironmentFriendly {
        var datas: DatasEnvObj
        var appearance: AppearanceEnvObj
        var name: String = ""
        var locationId: Int? = nil
        var minMembers: Int? = nil
        var maxMembers: Int? = nil
        var minScore: Int? = nil
        var limit: Int? = nil
    }
    struct PlayerLeaderboard: EnvironmentFriendly {
        var datas: DatasEnvObj
        var appearance: AppearanceEnvObj
        let region: DataSet.Regions
    }
    struct ClanLeaderboard: EnvironmentFriendly {
        enum SearchMode { case clans, warClans }
        var datas: DatasEnvObj
        var appearance: AppearanceEnvObj
        let region: DataSet.Regions
        let `for`: SearchMode
    }
    struct GlobalTourneyInfo: EnvironmentFriendly {
        var datas: DatasEnvObj
        var appearance: AppearanceEnvObj
    }
    struct GlobalTourneyLeaderboard: EnvironmentFriendly {
        var datas: DatasEnvObj
        var appearance: AppearanceEnvObj
        var tag: String
    }
}

