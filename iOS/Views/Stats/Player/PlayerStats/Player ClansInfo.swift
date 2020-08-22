import SwiftUI

extension PlayerBaseView.StatsView {
    func makeClanInfo() -> some View {
        VStack(spacing: 0) {
            
            let profile = datas.playerProfile
            
            makeStatsList(title: "Clan Info",
                          pairs: [
                            .init(key: "Donations", values: [profile.totalDonations.addGroupingSeparator()]),
                            .init(key: "Collection-Day Cards",
                                  values: [profile.clanCardsCollected.addGroupingSeparator()]),
                            .init(key: "War-Day Wins", values: [profile.warDayWins.addGroupingSeparator()])
                          ])
        }
        .customPadding(t: 4, l: 3, b: 4, tr: 3)
        .background(Color.custom(.white()))
        .customCornerRadius(8)
        .customPadding(t: 5, l: 8, b: 5, tr: 8)
        .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 2)
    }
}
