import SwiftUI

extension PlayerBaseView {
    struct StatsView: View {
        
        @EnvironmentObject var datas: EnvObjs.Datas
        @EnvironmentObject var appearance: EnvObjs.Appearance
        @Environment(\.managedObjectContext) var moc
        @Environment(\.openURL) var openURL
        
        @Binding var addDeckMenuIsVisible: Bool
        @Binding var addDeckMenuDeckCards: [String]
        
        @State var playerDeckIndex = 0
        
        var renderForSharingAsImage: Bool = false
        
        var body: some View {
            BGStack {
                let profile = datas.playerProfile
                
                VStack(spacing: 0) {
                    if profile.tag != "" {
                        makeBasicInfo()
                        makeBadges()
                        makeAccountInfo()
                        makeTrophiesInfo()
                        if !renderForSharingAsImage {
                            makePlayerDecks()
                            makeBattlesSummary()
                        }
                        makeCardStats()
                        makeBattlesInfo()
                        makeChallengesInfo()
                        if !renderForSharingAsImage {
                            makeChests()
                        }
                        makeClanInfo()
                    }
                }
            }
        }
        
    }
}


//struct PlayerStatsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerBaseView.StatsView()
//            .environmentObject(EnvObjs.Datas.testData)
//            .environmentObject(EnvObjs.Appearance())
//    }
//}
