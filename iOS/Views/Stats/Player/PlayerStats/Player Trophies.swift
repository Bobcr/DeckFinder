import SwiftUI

extension PlayerBaseView.StatsView {
    func makeTrophiesInfo() -> some View {
        
        VStack(spacing: 0) {
            let profile = datas.playerProfile
            let stats = profile.leagueStatistics
            
            let makeImage: (Int) -> Image = { trophies in
                Image(DataSet.Arena.find(trophies: trophies).imageName)
            }
            let rankPolisher: (Int) -> String = { rank in
                if rank == 0 { return "Unknown" }
                else { return "#" + rank.description }
            }
            
            makeStatsList(title: "Trophies 🏆",
                          pairs: [
                            .init(key: "All Time Best", values: [profile.bestTrophies.description]),
                            .init(key: "Current Trophies", values: [stats.currentSeason.trophies.description]),
                            .init(key: "Current Season Best",
                                  values: [stats.currentSeason.bestTrophies.description]),
                            .init(key: "Current Rank", values: [rankPolisher(stats.currentSeason.rank)]),
                            .init(key: "Best Rank's End Trophies", values: [stats.bestSeason.trophies.description]),
                            .init(key: "Season Date", values: [stats.bestSeason.id.description]),
                            .init(key: "Beast Rank", values: [rankPolisher(stats.bestSeason.rank)]),
                            .init(key: "Previous Season End",
                                  values: [stats.previousSeason.trophies.description]),
                            .init(key: "Previous Season Best",
                                  values: [stats.previousSeason.bestTrophies.description]),
                            .init(key: "Season Date", values: [stats.previousSeason.id.description]),
                            .init(key: "Previous Season Rank", values: [rankPolisher(stats.previousSeason.rank)])
                          ],
                          dividerIndices: [0, 3, 6],
                          imageIndices: [
                            (0, makeImage(profile.bestTrophies)),
                            (1, makeImage(stats.currentSeason.trophies)),
                            (2, makeImage(stats.currentSeason.bestTrophies)),
                            (4, makeImage(stats.bestSeason.trophies)),
                            (7, makeImage(stats.previousSeason.trophies)),
                            (8, makeImage(stats.previousSeason.bestTrophies))
                          ])
            
        }
        .customPadding(t: 4, l: 3, b: 4, tr: 3)
        .background(Color.custom(.white()))
        .customCornerRadius(8)
        .customPadding(t: 5, l: 8, b: 5, tr: 8)
        .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 2)
    }
}
