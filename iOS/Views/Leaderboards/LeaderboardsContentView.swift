import SwiftUI

extension LeaderboardsBaseView {
    struct LeaderboardsContentView: View {
        
        enum GTMode { case leaderboard, rewardsComparison }
        @State var gtMode: GTMode = .leaderboard
        
        @Binding var leaderboardMode: Mode
        @Binding var region: DataSet.Regions
        
        @EnvironmentObject var datas: EnvObjs.Datas
        @EnvironmentObject var appearance: EnvObjs.Appearance
        @Environment(\.openURL) var openURL
        
        var body: some View {
            ZStack(alignment: .bottomTrailing) {
                switch leaderboardMode {
                case .players:
                    makePlayersContent()
                case .clans, .warClans:
                    makeClansContent()
                case .globalTourney:
                    makeGTContent()
                default:
                    makeRAAPILeaderboardsContent()
                }
            }
        }
    }
}
