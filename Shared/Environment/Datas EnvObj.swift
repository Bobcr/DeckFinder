import Foundation
import SwiftUI

typealias DatasEnvObj = EnvironmentObject<EnvObjs.Datas>.Wrapper

extension EnvObjs {
    class Datas: ObservableObject {
        typealias OModels = OAPI.Models
        typealias RAModels = RAAPI.Models
        
        @Published var playerProfile = OModels.PlayerProfile()
        @Published var playerChests = OModels.PlayerChests()
        @Published var playerCardsStats = [StringArrayOfStringPair]()
        @Published var playerBattles = [OModels.PlayerBattle]()
        @Published var playerNameSearch = [RAModels.PlayerNameSearch]()
        
        @Published var clanProfile = OModels.ClanProfile()
        @Published var clanCurrentWar = OModels.ClanCurrentWar()
        @Published var clanWarLog = OModels.ClanWarLog()
        @Published var clanNameSearch = OModels.ClanNameSearch()
        
        @Published var playerLeaderbaord = OModels.PlayerLeaderboard()
        @Published var clanLeaderboard = OModels.ClanLeaderboard()
        @Published var raLeaderboards = RAModels.Leaderboards()
        
        @Published var gtInfo = OModels.GTInfo()
        @Published var gtRewardsComparison:
            GeneralModels.GTRewardsComparer.GTRewardsComparisonType? = nil
        @Published var gtLeaderbord = OModels.GTLeaderboard()
    }
}


extension EnvObjs.Datas {
    static var testData: EnvObjs.Datas {
        let datas = EnvObjs.Datas()
        datas.raLeaderboards = RAAPI.Models.Leaderboards.testData
        datas.playerBattles = OAPI.Models.TestData.playerBattles
        datas.clanProfile = OAPI.Models.TestData.clanProfile
        return datas
    }
}
