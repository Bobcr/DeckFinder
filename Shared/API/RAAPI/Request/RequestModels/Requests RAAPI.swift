import Foundation

extension Requests {
    struct PlayerNameSearch: EnvironmentFriendly {
        var datas: DatasEnvObj
        var appearance: AppearanceEnvObj
        var name: String
    }
    struct RALeaderboards: EnvironmentFriendly {
        var datas: DatasEnvObj
        var appearance: AppearanceEnvObj
        var mode: LeaderboardsBaseView.Mode
    }
}
