import SwiftUI

extension PlayerBaseView.StatsView {
    func makeBattlesInfo() -> some View {
        VStack(spacing: 0) {
            
            let profile = datas.playerProfile
            let battleCount = profile.battleCount
            
            let makePercentage: (Int, Int) -> String = { smaller, bigger in
                ((Double(smaller)/Double(bigger))*100).maxDigitCount(3) + "%"
            }
            
            let wins = profile.wins
            let winsPercentage = makePercentage(wins, battleCount)
            
            let losses = profile.losses
            let lossesPercentage = makePercentage(losses, battleCount)
            
            let threeCrownWins = profile.threeCrownWins
            let threeCrownWinsPercentage = makePercentage(threeCrownWins, battleCount)
            
            let oneVOnePlusTwoVTwoCount = battleCount - wins - losses
            let oneVOnePlusTwoVTwoCountPercentage = makePercentage(oneVOnePlusTwoVTwoCount, battleCount)
            
            let estimatedBattleTimeInSeconds = 60 * 3.75
            let estimatedSecondsSpentPlaying = estimatedBattleTimeInSeconds * Double(battleCount)
            let date = Date(timeInterval: estimatedSecondsSpentPlaying, since: Date())
            let estimatedTimeSpentPlaying = Funcs.timeDifference(date: date, emitAgo: true)
            
            makeStatsList(title: "Battles Info",
                          pairs: [
                            .init(key: "Battle Count", values: [battleCount.addGroupingSeparator()]),
                            .init(key: "Estimated Time Played", values: [estimatedTimeSpentPlaying]),
                            .init(key: "Wins", values: [wins.addGroupingSeparator(), winsPercentage]),
                            .init(key: "Losses", values: [losses.addGroupingSeparator(), lossesPercentage]),
                            .init(key: "Three Crown Wins", values: [threeCrownWins.addGroupingSeparator(),
                                                                    threeCrownWinsPercentage]),
                            .init(key: "1v1 Draws + 2v2 Games", values: [oneVOnePlusTwoVTwoCount.addGroupingSeparator(),
                                                                         oneVOnePlusTwoVTwoCountPercentage])
                          ])
        }
        .customPadding(t: 4, l: 3, b: 4, tr: 3)
        .background(Color.custom(.white()))
        .customCornerRadius(8)
        .customPadding(t: 5, l: 8, b: 5, tr: 8)
        .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 2)
    }
}
